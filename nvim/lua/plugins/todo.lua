return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- -- your configuration comes here
    -- -- or leave it empty to use the default settings
    -- -- refer to the configuration section below
    --
    -- -- pattern = [[\b(KEYWORDS)\b]],
    -- search = {
    --   command = "rg",
    --   args = {
    --     "--color=never",
    --     "--no-heading",
    --     "--with-filename",
    --     "--line-number",
    --     "--column",
    --   },
    --   -- regex that will be used to match keywords.
    --   -- don't replace the (KEYWORDS) placeholder
    --   -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    --   -- pattern = [[\b(KEYWORDS):|\b(KEYWORDS).*:]],
    --   pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    -- },
  },
  config = function()
    require("todo-comments").setup({
      highlight = {
        before = "",          -- "fg" or "bg" or empty
        keyword = "bg",       -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg",         -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)(\([^\)]*\))?:]],
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400,   -- ignore lines longer than this
        exclude = {},         -- list of file types to exclude highlighting
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
      },
    })
  end,
}
