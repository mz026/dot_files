return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim'
    },
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
    config = function()
      vim.opt.conceallevel = 2
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.markdown_fenced_languages = {
        'python',
        'go',
        'javascript',
        'typescript'
      }
    end
}
