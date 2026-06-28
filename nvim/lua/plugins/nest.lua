return {
	"LionC/nest.nvim",
	config = function()
		--    require("nest").setup()
		--

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "quarto",
			callback = function(events, opts)
				quarun = require("config/quarto_code_runner")
				-- vim.cmd("MoltenInit")
				-- vim.api.nvim_create_autocmd("BufWritePost", {
				-- 	buffer = opts.bufnr,
				-- 	callback = function()
				-- 		vim.cmd("MoltenSave")
				-- 	end,
				-- })
				require("nest").applyKeymaps({
					{
						mode = "n",
						"<leader>r",
						expr = true,
						buffer = true,
						{
							{ "r", quarun.run_cell },
							{ "a", quarun.run_all_above },
							{ "l", quarun.run_line },
							{ "c", "<cmd>MoltenEvaluateVisual<CR>", mode = "nv" },
							{ "d", "<cmd>MoltenDelete<CR>" },
							{ "h", "<cmd>MoltenHideOutput<CR>" },
							{ "o", "<cmd>noautocmd MoltenEnterOutput<CR>" },
						},
					},
				})
			end,
		})
		require("nest").applyKeymaps({
			{
				mode = "nvo",
				"<leader><leader>",
				expr = true,
				{
					{ "f", require("telescope.builtin").find_files },
					{ "b", require("telescope.builtin").buffers },
					{ "t", require("telescope.builtin").treesitter },
					{ "j", require("telescope.builtin").jumplist },
					{ "m", require("telescope.builtin").marks },
					{ "u", require("telescope").extensions.undo.undo },
				},
			},
			{
				mode = "nvo",
				"<leader>",
				{
					{ "n", "<cmd>NvimTreeToggle<CR>" },
					-- { "s",  "<cmd>Neotree document_symbols<CR>" },
					-- { "ss", require("resession").save },
					-- { "sl", require("resession").load },
					-- { "sd", require("resession").delete },
					{ "o", require("overseer").toggle },
					{ "w", "w", mode = "nvo" },
					{ "e", "e", mode = "nvo" },
					{ "b", "b", mode = "nvo" },
					{ "ge", "ge", mode = "nvo" },
					{
						mode = "n",
						"r",
						expr = true,
						{
							{ "l", "<cmd>MoltenEvaluateLine<CR>" },
							{ "r", "<cmd>MoltenReevaluateCell<CR>" },
							{ "c", "<cmd>MoltenEvaluateVisual<CR>", mode = "nv" },
							{ "d", "<cmd>MoltenDelete<CR>" },
							{ "h", "<cmd>MoltenHideOutput<CR>" },
							{ "o", "<cmd>noautocmd MoltenEnterOutput<CR>" },
						},
					},
				},
			},
			{
				mode = "n",
				expr = true,
				"<space>",
				{
					{ "f", vim.lsp.buf.code_action },
					{ "h", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>" },
					{ "e", vim.diagnostic.open_float },
					{ "k", vim.lsp.buf.hover },
					{ "n", vim.lsp.buf.rename },
					-- { "q", vim.diagnostic.setloclist },
					{
						"q",
						"<cmd>Trouble diagnostics toggle<cr>",
					},
					{
						"l",
						"<cmd>Trouble loclist toggle<cr>",
					},
					{
						"i",
						"<cmd>Trouble qflist toggle<cr>",
					},
					{ "d", "<cmd>TodoTrouble<CR>" },
					-- { "r", require("telescope").extensions.refactoring.refactors, mode = "nvo" },
					{ "s", vim.lsp.buf.signature_help },
					{ "t", vim.lsp.buf.type_definition },
					{ "o", "<cmd>Trouble symbols toggle win.position=left focus=true<cr>" },
				},
			},
			{
				mode = "n",
				expr = true,
				"g",
				{
					{ "d", vim.lsp.buf.definition },
					{ "D", vim.lsp.buf.declaration },
					{ "i", vim.lsp.buf.implementation },
					-- { "r", vim.lsp.buf.references },
					{
						"r",
						function()
							require("trouble").toggle("lsp_references")
						end,
					},
					{ "n", vim.diagnostic.goto_next },
					{ "p", vim.diagnostic.goto_prev },
					{ "h", "<cmd>ClangdSwitchSourceHeader<CR>" },
				},
			},
			{ "cw", "ce", options = { noremap = false } },
			{ "cW", "cE", options = { noremap = false } },
			{ "#", "*" },
			{ "*", "#" },
			-- { "\\", "<cmd>Neotree buffers<CR>", mode = "n" },
		})
	end,
}
