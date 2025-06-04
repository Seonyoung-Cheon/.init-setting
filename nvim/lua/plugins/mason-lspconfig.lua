return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = { exclude = { "tblgen_lsp", "mlir_lsp" } },
		})
	end,
}
