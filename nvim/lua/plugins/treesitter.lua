return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"cuda",
				"lua",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"verilog",
				"yaml",
				"objc",
				"proto",
				"json",
				"go",
				"rust",
				"python",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			highlight = { enable = true },
			textsubjects = {
				enable = true,
				keymaps = {
					["<cr>"] = "textsubjects-smart", -- works in visual mode
				},
			},

			-- indent = { enable = true },
		})
		-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		-- parser_config.mlir = {
		--   install_info = {
		--     url = vim.fn.stdpath("config") .. "/plugins/tree-sitter-mlir", -- local path or git repo
		--     files = { "src/parser.c" },                                -- note that some parsers also require src/scanner.c or src/scanner.cc
		--     -- optional entries:
		--     -- branch = "main",                    -- default branch in case of git repo if different from master
		--     generate_requires_npm = true,      -- if stand-alone parser without npm dependencies
		--     requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
		--   },
		--   filetype = "zu",                     -- if filetype does not match the parser name
		-- }
	end,
}
