return {
  {
    "vimpostor/vim-tpipeline",
    enabled = false,
    event = "VeryLazy", -- 또는 "VeryLazy"
    config = function()
      vim.g.tpipeline_autoembed = 0
      vim.g.tpipeline_restore = 0
      vim.g.tpipeline_statusline = " #[fg=white,bg=#666666] #[fg=white,bg=#666666,bold] #S #[fg=#666666,bg=default] "
    end,
  },
}
