return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup({
      opts = {
        -- add any options here
      },
      toggler = {
        line = 'gc',
        block = 'gb',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      mappings = {
        basic = true,
        extra = true,
      },
    })
  end,
}
