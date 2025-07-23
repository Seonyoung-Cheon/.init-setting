return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  --[[ event = "InsertEnter", ]]
  lazy = true,
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 50,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    })
  end,
}
