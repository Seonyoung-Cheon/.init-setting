return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")

    local setup_target = status_ok and ts_configs or require("nvim-treesitter")

    setup_target.setup({
      ensure_installed = {
        "c",
        "cpp",
        "cuda",
        "lua",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "javascript",
        "html",
        "verilog",
        "yaml",
        "objc",
        "proto",
        "json",
        "go",
        "rust",
        "python",
      },
      sync_install = false,
      highlight = { enable = true },
      textsubjects = {
        enable = true,
        keymaps = {
          ["<cr>"] = "textsubjects-smart", -- 비주얼 모드에서 작동
        },
      },
      -- indent = { enable = true },
    })

    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    -- parser_config.mlir = {
    --   install_info = {
    --     url = vim.fn.stdpath("config") .. "/plugins/tree-sitter-mlir",
    --     files = { "src/parser.c" },
    --     generate_requires_npm = true,
    --     requires_generate_from_grammar = true,
    --   },
    --   filetype = "zu",
    -- }
  end,
}
