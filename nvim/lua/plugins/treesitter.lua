return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "python",
        "go",
        "javascript",
        "bash",
        "sql",
        "typescript",
        "lua",
        "vimdoc",
        'markdown',
        'markdown_inline'
      },
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
    })
  end
}
