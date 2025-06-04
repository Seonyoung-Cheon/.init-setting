return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  config = function()
    require("leap").add_default_mappings(true)
    -- require("leap").add_repeat_mappings(";", ",", {
    -- 	-- False by default. If set to true, the keys will work like the
    -- 	-- native semicolon/comma, i.e., forward/backward is understood in
    -- 	-- relation to the last motion.
    -- 	-- relative_directions = true,
    -- 	-- By default, all modes are included.
    -- 	modes = { "n", "x", "o" },
    -- })
    vim.keymap.del({ "x", "o" }, "x")
    vim.keymap.del({ "x", "o" }, "X")
    -- -- To set alternative keys for "exclusive" selection:
    -- vim.keymap.set({'x', 'o'}, <some-other-key>, '<Plug>(leap-forward-till)')
    -- vim.keymap.set({'x', 'o'}, <some-other-key>, '<Plug>(leap-backward-till)')
  end,
}
