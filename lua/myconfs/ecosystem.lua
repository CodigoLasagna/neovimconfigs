-- apply some configs deppending on the ecosystem --
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
Main_workingdir = ""

if Hostname then
	if Hostname == "LEGION" then
		vim.cmd('colorscheme eros_net')
		vim.cmd('lcd ~/gen/archives/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/gen/archives/work/coding/notes/']")
		Main_workingdir = "~/gen/archives/work/coding/"
	elseif Hostname == "EONIX" then
		vim.cmd('colorscheme neohub')
		vim.cmd('lcd ~/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/work/coding/notas/']")
		Main_workingdir = "~/work/coding/"
	elseif Hostname == "SERVER" then
		vim.cmd('colorscheme neohub')
		vim.cmd('lcd ~/work/coding/')
		vim.cmd(":let g:notes_directories = ['~/work/coding/notas/']")
		Main_workingdir = "~/work/coding/"
	else
		vim.cmd('colorscheme quiet')
	end
end
