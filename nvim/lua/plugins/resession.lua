-- return {
-- 	"stevearc/resession.nvim",
-- 	config = function()
-- 		local resession = require("resession")
-- 		-- resession.setup()
-- 		resession.setup({
-- 			autosave = {
-- 				enabled = true,
-- 				interval = 60,
-- 				notify = true,
-- 			},
-- 			extensions = {
-- 				overseer = {
-- 					-- customize here
-- 				},
-- 			},
-- 		})
-- 		-- Resession does NOTHING automagically, so we have to set up some keymaps
-- 		-- vim.keymap.set("n", "<leader>ss", resession.save)
-- 		-- vim.keymap.set("n", "<leader>sl", resession.load)
-- 		-- vim.keymap.set("n", "<leader>sd", resession.delete)
-- 		vim.api.nvim_create_autocmd("VimLeavePre", {
-- 			callback = function()
-- 				-- Always save a special session named "last"
-- 				resession.save("last")
-- 			end,
-- 		})
-- 		vim.api.nvim_create_autocmd("VimEnter", {
-- 			callback = function()
-- 				-- Only load the session if nvim was started with no args
-- 				if vim.fn.argc(-1) == 0 then
-- 					-- Save these to a different directory, so our manual sessions don't get polluted
-- 					resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
-- 				end
-- 			end,
-- 		})
-- 		vim.api.nvim_create_autocmd("VimLeavePre", {
-- 			callback = function()
-- 				resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
-- 			end,
-- 		})
-- 	end,
-- }
return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    })
  end,
}
