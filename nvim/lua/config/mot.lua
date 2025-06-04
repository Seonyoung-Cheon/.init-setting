local REL = {}
local RELdepth = {}
local RELdirection = {}

nav_highlight = "navigating_highlight"
local ns_id = vim.api.nvim_create_namespace(nav_highlight)
local pallete = { bg1 = "PmenuThumb", bg2 = "MatchParen", bg3 = "PmenuSbar", bg4 = "PmenuSbar", bg5 = "PmenuSbar" }

function VisualRelative()
	local buffer_id = vim.api.nvim_get_current_buf()
	if RELdepth[buffer_id] == nil then
		RELdepth[buffer_id] = 0
	end
	RELdepth[buffer_id] = RELdepth[buffer_id] + 1
	highlightREL()
end
function VisualRelativeLarge()
	local buffer_id = vim.api.nvim_get_current_buf()
	if RELdepth[buffer_id] == nil then
		RELdepth[buffer_id] = 0
	end
	if RELdepth[buffer_id] == 0 then
		RELdepth[buffer_id] = RELdepth[buffer_id] + 1
	else
		RELdepth[buffer_id] = RELdepth[buffer_id] + 3
	end
	highlightREL()
end

function highlightREL()
	local buffer_id = vim.api.nvim_get_current_buf()
	if RELdepth[buffer_id] == nil or RELdepth[buffer_id] == 0 then
		return
	end
	vim.api.nvim_buf_clear_namespace(buffer_id, ns_id, 0, -1)
	local current_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
	for i = 1, 3 do
		local offset = RELdepth[buffer_id] * 5 - 5
		local before_start_line = math.max(1, current_line - 5 * i - offset - 1)
		local before_end_line = math.max(0, current_line - 5 * i + 5 - offset - 1)
		-- local my_group = [i]
		if before_end_line > 0 then
			vim.api.nvim_buf_set_extmark(buffer_id, ns_id, before_start_line, 0, {
				end_row = before_end_line,
				hl_eol = true,
				hl_group = pallete["bg" .. i],
			})
		end
		local eofline = vim.api.nvim_buf_line_count(buffer_id)
		local after_start_line = math.min(eofline + 1, current_line + 5 * i - 5 + offset)
		local after_end_line = math.min(eofline, current_line + 5 * i + offset)
		if after_start_line < eofline then
			vim.api.nvim_buf_set_extmark(buffer_id, ns_id, after_start_line, 0, {
				end_row = after_end_line,
				hl_eol = true,
				hl_group = pallete["bg" .. i],
			})
		end
	end
end

function FinishREL(up)
	local buffer_id = vim.api.nvim_get_current_buf()
	if RELdepth[buffer_id] and RELdepth[buffer_id] > 0 then
		vim.api.nvim_buf_clear_namespace(buffer_id, ns_id, 0, -1)
		RELdirection[buffer_id] = up
		if RELdepth[buffer_id] > 1 then
			if up then
				vim.cmd("normal! " .. 5 * RELdepth[buffer_id] - 5 .. "k")
			else
				vim.cmd("normal! " .. 5 * RELdepth[buffer_id] - 5 .. "j")
			end
		end
		RELdepth[buffer_id] = 0
	end
end

function RepeatREL(count)
	local buffer_id = vim.api.nvim_get_current_buf()
	if RELdirection[buffer_id] ~= nil then
		local r, c = unpack(vim.api.nvim_win_get_cursor(0))
		vim.cmd("normal! ;")
		local newr, newc = unpack(vim.api.nvim_win_get_cursor(0))
		if newr ~= r or newc ~= c then
			return
		end
		if RELdirection[buffer_id] then
			vim.cmd("normal! 5k")
		else
			vim.cmd("normal! 5j")
		end
	else
		vim.cmd("normal! ;")
	end
end

local MOT = {}
local previousRel = {}
local repeatOnce = {}
local direction = {}
local doubleToggle = {}

function MiddleOfText()
	local buffer_id = vim.api.nvim_get_current_buf()
	if MOT[buffer_id] then
		doubleToggle[buffer_id] = not doubleToggle[buffer_id]
		highlightLines()
		return
	end
	doubleToggle[buffer_id] = false
	previousRel[buffer_id] = vim.opt.relativenumber
	local lines_above = vim.fn.winheight(0) / 2
	vim.cmd(string.format("normal! H%dj", lines_above))
	MOT[buffer_id] = true
	highlightLines()
	vim.opt.relativenumber = true
end

function ScrollMOT(up)
	local buffer_id = vim.api.nvim_get_current_buf()
	if MOT[buffer_id] then
		if up then
			vim.cmd(doubleToggle[buffer_id] and "normal! 15k" or "normal! 10k")
		else
			vim.cmd(doubleToggle[buffer_id] and "normal! 15j" or "normal! 10j")
		end
		doubleToggle[buffer_id] = false
		highlightLines()
		return
	end
	if up then
		vim.cmd(vim.api.nvim_replace_termcodes("normal! <C-u>", true, true, true))
	else
		vim.cmd(vim.api.nvim_replace_termcodes("normal! <C-d>", true, true, true))
	end
end

-- Define a custom highlight group name

-- Clear any existing extmarks in the custom highlight group local
function highlightLines()
	-- Calculate the line numbers for highlighting

	local buffer_id = vim.api.nvim_get_current_buf()
	if not MOT[buffer_id] then
		return
	end

	vim.api.nvim_buf_clear_namespace(buffer_id, ns_id, 0, -1)
	local current_line, _ = unpack(vim.api.nvim_win_get_cursor(0))

	-- Clear any existing matches in the 'Search' highlight group
	-- vim.cmd("match none")
	local buffer_id = vim.api.nvim_get_current_buf()

	for i = 1, 5 do
		local offset = doubleToggle[buffer_id] and 5 or 0
		local before_start_line = math.max(1, current_line - 10 * i + 4 - offset)
		local before_end_line = math.max(0, current_line - 10 * i + 9 - offset)
		-- local my_group = [i]
		if before_end_line > 0 then
			vim.api.nvim_buf_set_extmark(buffer_id, ns_id, before_start_line, 0, {
				end_row = before_end_line,
				hl_eol = true,
				hl_group = pallete["bg" .. i],
			})
		end
		local eofline = vim.api.nvim_buf_line_count(buffer_id)
		local after_start_line = math.min(eofline + 1, current_line + 10 * i - 10 + offset)
		local after_end_line = math.min(eofline, current_line + 10 * i - 5 + offset)
		if after_start_line < eofline then
			vim.api.nvim_buf_set_extmark(buffer_id, ns_id, after_start_line, 0, {
				end_row = after_end_line,
				hl_eol = true,
				hl_group = pallete["bg" .. i],
			})
		end
	end
end

function FinishMOT(up)
	local buffer_id = vim.api.nvim_get_current_buf()
	if MOT[buffer_id] then
		MOT[buffer_id] = false
		vim.opt.relativenumber = previousRel[buffer_id]
		vim.api.nvim_buf_clear_namespace(buffer_id, ns_id, 0, -1)
		direction[buffer_id] = up
		repeatOnce[buffer_id] = true
		if doubleToggle[buffer_id] then
			if direction[buffer_id] then
				vim.cmd("normal! 5k")
			else
				vim.cmd("normal! 5j")
			end
		end
	end
end

function RepeatMOT(count)
	local buffer_id = vim.api.nvim_get_current_buf()
	if repeatOnce[buffer_id] then
		repeatOnce[buffer_id] = false
		local r, c = unpack(vim.api.nvim_win_get_cursor(0))
		vim.cmd("normal! ;")
		local newr, newc = unpack(vim.api.nvim_win_get_cursor(0))
		if newr ~= r or newc ~= c then
			return
		end
		repeatOnce[buffer_id] = true
		if direction[buffer_id] then
			vim.cmd("normal! 5k")
		else
			vim.cmd("normal! 5j")
		end
	else
		vim.cmd("normal! ;")
	end
end
