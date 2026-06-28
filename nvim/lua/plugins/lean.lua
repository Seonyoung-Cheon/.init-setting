return {
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "andymass/vim-matchup",
      -- "andrewradev/switch.vim",
      -- "tomtom/tcomment_vim",
    },
    init = function()
      vim.g.lean_config = {
        mappings = true,
      }
    end,
  },
}
