local options = {
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	expandtab = true,
	number = true,
	termguicolors = true,
	cursorline = true,
	wildmenu = true,
	lazyredraw = true,
	showmatch = true,
	breakindent = true,
	showbreak = ">",
	foldlevelstart = 10,
	foldnestmax = 10,
	-- foldmethod = "syntax",
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	undofile = true,
	undodir = vim.fn.stdpath("config") .. "/undo",
	clipboard = "unnamedplus",
	shell = "/usr/bin/zsh",
	shellcmdflag = "-ic",
	background = "dark",
	-- sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
}
-- vim.cmd.colorscheme("gruvbox")
for k, v in pairs(options) do
	vim.opt[k] = v
end

require("config/term")
-- require("config/mot")
