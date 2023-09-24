-- Get hostname --
function Get_hostname()
	local status, hostname = pcall(vim.loop.os_gethostname)
	if status then
		return hostname
	else
		return nil
	end
end

-- save hostname --
local hostname = Get_hostname()

-- apply some configs deppending on the ecosystem --
if hostname then
	if hostname == "LEGION" then
		vim.cmd('colorscheme eros_net')
		vim.cmd('lcd ~/gen/archives/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/gen/archives/work/coding/notes/']")
	elseif hostname == "EONIX" then
		vim.cmd('colorscheme neohub')
		vim.cmd('lcd ~/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/work/coding/notas/']")
	else
		vim.cmd('colorscheme quiet')
	end
end
