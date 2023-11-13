function OpenTerminal(root_dir, command)
	local work_dir = ''

	if root_dir then
		work_dir = ' cd ' .. vim.fn.fnameescape(root_dir)
	end

	local terminal_bufnr = -1

	-- Buscar el buffer del terminal abierto
	for _, winid in ipairs(vim.fn.getbufinfo({buflisted = 1})) do
		local buftype = vim.fn.getbufvar(winid.bufnr, '&buftype')

		if buftype == 'terminal' then
			terminal_bufnr = winid.bufnr
			break
		end
	end

	-- Cerrar el terminal si ya está abierto
	if terminal_bufnr ~= -1 then
		vim.api.nvim_buf_delete(terminal_bufnr, { force = true })
	else
		-- Abrir split horizontal con un terminal
		vim.cmd('botright split')
		if root_dir then
			vim.cmd(work_dir)
		end
		if command then
			command = 'term ' .. command
			vim.cmd(command)
		else
			vim.cmd('term')
		end

		-- Ajustar el tamaño del split (un tercio o 4 del alto de la terminal)
		local terminal_size = vim.fn.winheight(0) / 2
		vim.cmd('resize ' .. terminal_size)

		-- Cambiar al modo terminal después de abrir el split
		vim.cmd('startinsert')
	end
end
