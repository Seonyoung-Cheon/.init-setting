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
    opts = {
      mappings = true,
    },
  },
}
