return {
  "mlir",
  dir = vim.fn.stdpath("config") .. "/plugins/mlir",
  config = function()
    vim.cmd([[
    " filetype plugin indent on
    " filetype plugin on
    " filetype indent on
    " syntax enable
    augroup filetype
      au! BufRead,BufNewFile *.mlir set filetype=mlir
    augroup END
    ]])
  end,
}
