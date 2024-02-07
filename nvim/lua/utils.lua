M = {}

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = false })
end

M.nmap = function (shortcut, command)
  map('n', shortcut, command)
end

M.imap = function (shortcut, command)
  map('i', shortcut, command)
end

M.vmap = function (shortcut, command)
  map('v', shortcut, command)
end

return M
