return {
	'ojroques/nvim-osc52',
	config = function()
		require('osc52').setup {
			max_length = 0, -- 클립보드 복사 제한 없음
			silent = false, -- 메시지 출력
			trim = false, -- 공백 자르지 않음
		}

		-- yank 이후 자동 클립보드 전송
		local function copy()
			if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
				require('osc52').copy_register('')
			end
		end

		vim.api.nvim_create_autocmd('TextYankPost', {
			callback = copy,
		})
	end,
}
