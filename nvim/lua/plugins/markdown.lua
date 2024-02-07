return {
  'preservim/vim-markdown',
  dependencies = {'godlygeek/tabular'},
  config = function()
    vim.opt.conceallevel = 2
    vim.g.vim_markdown_conceal_code_blocks = 0
    vim.g.vim_markdown_toc_autofit = 1
  end
}
