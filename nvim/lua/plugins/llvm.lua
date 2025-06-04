return {
  "llvm",
  dir = vim.fn.stdpath("config") .. "/plugins/llvm",
  config = function()
    vim.cmd([[
    " filetype plugin indent on
    " filetype plugin on
    " filetype indent on
    " syntax enable
    augroup filetype
      au! BufRead,BufNewFile *.llvm set filetype=llvm
    augroup END
    augroup filetype
      au! BufRead,BufNewFile *.td set filetype=tablegen
    augroup END
    ]])
  end,
}
