return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				undo = {
					-- telescope-undo.nvim config, see below
				},
			},
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<c-t>"] = require("trouble").open_with_trouble,
					},
					n = { ["<c-t>"] = require("trouble").open_with_trouble },
				},
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					sort_mru = true,
					mappings = {
						n = {
							["dd"] = "delete_buffer",
						},
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("undo")
		-- require("telescope").load_extension("harpoon")
		vim.api.nvim_create_user_command("Rg", function(dic)
			if #dic.fargs > 0 then
				-- print(dic.fargs[1])
				require("telescope.builtin").grep_string({ search = dic.fargs[1] })
			else
				require("telescope.builtin").live_grep()
			end
		end, { nargs = "?" })

		-- require("telescope").load_extension("session-lens")
	end,
}
