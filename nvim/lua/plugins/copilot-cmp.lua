return {
	"zbirenbaum/copilot-cmp",
	dependencies = { "copilot.lua" },
	enabled = false,
	config = function()
		require("copilot_cmp").setup()
	end,
}
