return {
  "folke/neodev.nvim",
  opts = {},
  config = function()
    require("neodev").setup({})

    -- example to setup lua_ls and enable call snippets
    vim.lsp.config['lua_ls'] = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    }
  end,
}
