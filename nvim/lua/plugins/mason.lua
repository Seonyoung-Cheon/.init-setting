return {
  "williamboman/mason.nvim",
  --Installed
  -- ◍ bash-language-server bashls
  -- ◍ beautysh
  -- ◍ clang-format
  -- ◍ clangd
  -- ◍ cmake-language-server cmake
  -- ◍ cmakelint
  -- ◍ codelldb
  -- ◍ cpplint
  -- ◍ json-lsp jsonls
  -- ◍ lua-language-server lua_ls
  -- ◍ mypy
  -- ◍ prettier
  -- ◍ pyright
  -- ◍ stylua
  -- ◍ yaml-language-server yamlls
  -- ◍ yamlfmt
  -- ◍ yamllint
  config = function()
    require("mason").setup()
  end,
}
