
vim.api.nvim_create_autocmd({'Colorscheme'}, {
  pattern = {'*'},
  callback = function ()
    vim.api.nvim_set_hl(0, 'EyelinerPrimary', { link = 'Constant' })
    vim.api.nvim_set_hl(0, 'EyelinerSecondary', { link = 'Define'})
    vim.api.nvim_set_hl(0, 'EyelinerDimmed', { link = 'Comment' })
  end
})
