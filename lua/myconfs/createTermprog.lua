function ToggleTerminal(root_dir)
	local termSize = 20
	local work_dir = root_dir and 'cd ' .. vim.fn.fnameescape(root_dir) or ''

	local is_terminal_open = false
	local terminal_bufnr = -1
	local terminal_winid = -1

	for _, winid in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		local buftype = vim.fn.getbufvar(winid.bufnr, '&buftype')

		if buftype == 'terminal' then
			is_terminal_open = true
			terminal_bufnr = winid.bufnr
			terminal_winid = vim.fn.bufwinid(terminal_bufnr)
			break
		end
	end

	if is_terminal_open then
		if (root_dir == nil) then
			if terminal_winid ~= -1 then
				local config = vim.api.nvim_win_get_config(terminal_winid)
				if (config.relative ~= "none") then
					vim.api.nvim_win_hide(terminal_winid)
				end
			else
				vim.cmd('botright split')
				vim.cmd('resize ' .. termSize)
				vim.api.nvim_win_set_buf(vim.fn.win_getid(), terminal_bufnr)
				vim.cmd('startinsert')
			end
		else
			if terminal_winid ~= -1 then
				vim.api.nvim_set_current_win(terminal_winid)
			else
				vim.cmd('botright split')
				vim.cmd('resize ' .. termSize)
				vim.api.nvim_win_set_buf(vim.fn.win_getid(), terminal_bufnr)
			end
			vim.cmd('startinsert')
		end
	else
		vim.cmd('botright split')
		vim.cmd(work_dir)
		vim.cmd('term')
		vim.cmd('resize ' .. termSize)
		vim.cmd('startinsert')
	end

end
