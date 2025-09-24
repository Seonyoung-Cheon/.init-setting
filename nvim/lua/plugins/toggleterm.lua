return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    size = 15,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float", -- "float" | "horizontal" | "vertical" | "tab"
    close_on_exit = true,
    shell = (function()
      local z = vim.fn.exepath("zsh")
      return (z ~= "" and z) or vim.o.shell
    end)(),
    float_opts = {
      border = "rounded",
      winblend = 0,
      highlights = { border = "Normal", background = "Normal" },
    },
  },
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<leader>tv", function() require("toggleterm").toggle(1, 15, vim.loop.cwd(), "vertical") end, desc = "Vertical terminal" },
    { "<leader>th", function() require("toggleterm").toggle(2, 15, vim.loop.cwd(), "horizontal") end, desc = "Horizontal terminal" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Better keymaps inside terminals
    local function set_terminal_keymaps()
      local kopts = { buffer = 0, silent = true, noremap = true }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], kopts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], kopts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], kopts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], kopts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], kopts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], kopts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], kopts)
    end
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = set_terminal_keymaps,
      desc = "ToggleTerm terminal keymaps",
    })

    -- Example: Lazygit in a floating terminal
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
    function _G.Lazygit_toggle() lazygit:toggle() end
    vim.keymap.set("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>", { desc = "Lazygit (ToggleTerm)" })

    -- Quick runners
    local python = Terminal:new({ cmd = "python", hidden = true })
    function _G.Python_toggle() python:toggle() end
    vim.keymap.set("n", "<leader>py", "<cmd>lua Python_toggle()<CR>", { desc = "Python REPL (ToggleTerm)" })
  end,
}

