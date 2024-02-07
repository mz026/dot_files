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
        "typescript"
      },

      highlight = {
        enable = true,
        disable = { "markdown", "md" },
      },
      indent = {
        enable = true
      },
    })
  end
}
