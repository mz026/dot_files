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
    config = function(_, opts)
      require('render-markdown').setup(opts)
      vim.opt.conceallevel = 2
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.markdown_fenced_languages = {
        'python',
        'go',
        'javascript',
        'typescript'
      }
      local mdtable = require('mdtable')
      vim.api.nvim_create_user_command('MdTable', mdtable.preview, {})
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(ev)
          vim.keymap.set('n', '<leader>m', mdtable.preview, { buffer = ev.buf })
        end,
      })
    end
}
