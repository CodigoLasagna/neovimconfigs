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
Hostname = Get_hostname() -- will be global

-- apply some configs deppending on the ecosystem --
if Hostname then
	if Hostname == "LEGION" then
		vim.cmd('colorscheme eros_net')
		vim.cmd('lcd ~/gen/archives/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/gen/archives/work/coding/notes/']")
	elseif Hostname == "EONIX" then
		vim.cmd('colorscheme neohub')
		vim.cmd('lcd ~/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/work/coding/notas/']")
	else
		vim.cmd('colorscheme quiet')
	end
end
