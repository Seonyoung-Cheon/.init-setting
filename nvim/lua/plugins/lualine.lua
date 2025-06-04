return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
        icons_enabled = true,
        component_separators = "",
        section_separators = "",
      },
      -- sections = { lualine_c = { require("auto-session.lib").current_session_name } },
      sections = {
        -- lualine_a = { "FugitiveHead" },
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "overseer", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress", "searchcount" },
        lualine_z = { "location" },
      },
    })
  end,
}
