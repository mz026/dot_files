local M = {}

local function width(s)
  return vim.fn.strdisplaywidth(s)
end

local function cells(line)
  local inner = vim.trim(line):gsub('^|', ''):gsub('|$', '')
  local out = {}
  for _, cell in ipairs(vim.split(inner, '|', { plain = true })) do
    out[#out + 1] = vim.trim(cell)
  end
  return out
end

local function is_delimiter(row)
  for _, cell in ipairs(row) do
    if not cell:match('^:?%-+:?$') then
      return false
    end
  end
  return #row > 0
end

-- Splits on spaces, then hard-splits any single run wider than the column, so
-- scripts without spaces (CJK) still wrap instead of overflowing.
local function chunks(text, limit)
  local out = {}
  for word in text:gmatch('%S+') do
    while width(word) > limit do
      local take = ''
      for char in word:gmatch('[%z\1-\127\194-\244][\128-\191]*') do
        if width(take .. char) > limit then
          break
        end
        take = take .. char
      end
      if take == '' then
        break
      end
      out[#out + 1] = take
      word = word:sub(#take + 1)
    end
    if word ~= '' then
      out[#out + 1] = word
    end
  end
  return out
end

local function wrap(text, limit)
  local lines, current = {}, ''
  for _, chunk in ipairs(chunks(text, limit)) do
    local joined = current == '' and chunk or current .. ' ' .. chunk
    if width(joined) <= limit then
      current = joined
    else
      lines[#lines + 1] = current
      current = chunk
    end
  end
  lines[#lines + 1] = current
  return lines
end

-- Narrow columns keep their natural width; what's left is split among the wide
-- ones, smallest first, so one long cell can't starve the rest.
local function fit(natural, available, min)
  local total = 0
  for _, w in ipairs(natural) do
    total = total + w
  end
  if total <= available then
    return natural
  end
  -- The floor has to bend for very narrow windows, or many columns each
  -- claiming the minimum would overshoot the budget and clip the right edge.
  min = math.min(min, math.floor(available / #natural))
  local order = {}
  for i = 1, #natural do
    order[i] = i
  end
  table.sort(order, function(a, b)
    return natural[a] < natural[b]
  end)
  local widths, remaining, left = {}, available, #natural
  for _, i in ipairs(order) do
    local share = math.max(math.floor(remaining / left), min)
    widths[i] = math.max(math.min(natural[i], share), 1)
    remaining = remaining - widths[i]
    left = left - 1
  end
  return widths
end

local function rule(widths, left, mid, right)
  local parts = {}
  for _, w in ipairs(widths) do
    parts[#parts + 1] = string.rep('─', w + 2)
  end
  return left .. table.concat(parts, mid) .. right
end

local function render(rows, available)
  local columns = 0
  for _, row in ipairs(rows) do
    columns = math.max(columns, #row)
  end
  local natural = {}
  for i = 1, columns do
    natural[i] = 1
    for _, row in ipairs(rows) do
      natural[i] = math.max(natural[i], width(row[i] or ''))
    end
  end
  local widths = fit(natural, available - (3 * columns + 1), 6)
  local separator = rule(widths, '├', '┼', '┤')

  local out = { rule(widths, '┌', '┬', '┐') }
  for index, row in ipairs(rows) do
    local wrapped, height = {}, 0
    for i = 1, columns do
      wrapped[i] = wrap(row[i] or '', widths[i])
      height = math.max(height, #wrapped[i])
    end
    for line = 1, height do
      local parts = {}
      for i = 1, columns do
        local text = wrapped[i][line] or ''
        parts[i] = ' ' .. text .. string.rep(' ', widths[i] - width(text)) .. ' '
      end
      out[#out + 1] = '│' .. table.concat(parts, '│') .. '│'
    end
    out[#out + 1] = index < #rows and separator or rule(widths, '└', '┴', '┘')
  end
  return out
end

local function table_at_cursor()
  local buffer = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local cursor = vim.api.nvim_win_get_cursor(0)[1]
  if not (buffer[cursor] or ''):match('^%s*|') then
    return nil
  end
  local first, last = cursor, cursor
  while first > 1 and (buffer[first - 1] or ''):match('^%s*|') do
    first = first - 1
  end
  while last < #buffer and (buffer[last + 1] or ''):match('^%s*|') do
    last = last + 1
  end
  local rows = {}
  for line = first, last do
    local row = cells(buffer[line])
    if not is_delimiter(row) then
      rows[#rows + 1] = row
    end
  end
  return rows
end

function M.preview()
  local rows = table_at_cursor()
  if not rows then
    vim.notify('mdtable: cursor is not on a table', vim.log.levels.WARN)
    return
  end
  local available = math.floor(vim.o.columns * 0.9)
  local lines = render(rows, available)
  local buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
  vim.bo[buffer].modifiable = false
  local height = math.min(#lines, vim.o.lines - 6)
  local window = vim.api.nvim_open_win(buffer, true, {
    relative = 'editor',
    width = available,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - available) / 2),
    border = 'none',
  })
  vim.wo[window].wrap = false
  vim.wo[window].number = false
  vim.wo[window].signcolumn = 'no'
  vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = buffer })
end

function M.test()
  assert(vim.deep_equal(fit({ 3, 5, 40 }, 30, 6), { 3, 5, 22 }), 'wide column absorbs the squeeze')
  assert(vim.deep_equal(fit({ 3, 5 }, 30, 6), { 3, 5 }), 'no squeeze when it already fits')
  local narrow = fit({ 9, 9, 9, 9, 9, 9 }, 18, 6)
  local narrow_total = 0
  for _, w in ipairs(narrow) do
    narrow_total = narrow_total + w
  end
  assert(narrow_total <= 18, 'minimum width never overshoots the budget')
  assert(vim.deep_equal(wrap('a bb ccc', 5), { 'a bb', 'ccc' }), 'greedy word wrap')
  assert(vim.deep_equal(wrap('聊天服務測試', 4), { '聊天', '服務', '測試' }), 'double width wrap')
  assert(is_delimiter({ '---', ':--:' }) and not is_delimiter({ 'a' }), 'delimiter row detection')
  print('mdtable: ok')
end

return M
