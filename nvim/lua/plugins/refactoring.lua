return {
  "ThePrimeagen/refactoring.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("plenary.async")
    require("refactoring").setup()
    require("telescope").load_extension("refactoring")
    -- vim.keymap.set({ "n", "x" }, "<leader>rr", function()
    --   require("telescope").extensions.refactoring.refactors()
    -- end)
  end,
}
