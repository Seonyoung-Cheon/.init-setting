return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
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
        auto_install = true,
      })
    end,
  },
}
