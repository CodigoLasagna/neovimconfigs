vim.api.nvim_set_keymap('n', '<C-l><C-l>', ':DBUIToggle<CR>', { noremap = true, silent = true })

function Setup_dbui_numbers()
	-- Obtiene el nombre de la ventana activa en Dadbod-UI
	local dbui_name = vim.fn.bufname(vim.fn.winbufnr(0))
	-- Comprueba si el nombre de la ventana contiene la palabra "dbui"
	if dbui_name and vim.fn.match(dbui_name, "dbui") >= 0 then
	-- Si contiene "dbui", establece números de línea y números relativos
		vim.cmd("set number relativenumber")
		vim.cmd("echom 'test'")
	else
	-- Si no contiene "dbui", desactiva números de línea y números relativos
		vim.cmd("set nonumber norelativenumber")
	end
end


-- vim.api.nvim_exec([[
--   autocmd WinEnter * lua Setup_dbui_numbers()
-- ]], false)
