local function find_root_dir()
	local current_dir = vim.fn.getcwd()
	repeat
		if
			vim.fn.filereadable(current_dir .. '/package.json') == 1 or
			vim.fn.filereadable(current_dir .. '/*.sln') == 1 or
			vim.fn.filereadable(current_dir .. '/*.git') == 1 or
			vim.fn.filereadable(current_dir .. '/.git') == 1 or
			vim.fn.filereadable(current_dir .. '/.gitignore') == 1 or
			vim.fn.filereadable(current_dir .. '/makefile') == 1 or
			vim.fn.filereadable(current_dir .. '/Makefile') == 1 then
			return current_dir
		end
		current_dir = vim.fn.fnamemodify(current_dir, ':h')
	until current_dir == '/'
end

function Compile()
	local filetype = vim.bo.filetype
	local root_dir = find_root_dir()
	vim.cmd('wa') -- save all files
	print(root_dir)
	ToggleTerminal(root_dir)
	if (filetype == "python") then
		vim.api.nvim_feedkeys('make\n', 'n', true)
	elseif (filetype == "c" or filetype == "cpp") then
		vim.api.nvim_feedkeys('make;./main\n', 'n', true)
	elseif (filetype == "cs") then
		local input = vim.fn.input('Directorio de APP: ')
		input = 'cd '.. root_dir .. '/' .. input .. ' ; dotnet run \n'
		vim.api.nvim_feedkeys(input, 'n', true)
	elseif (filetype == "java") then
		local input = vim.fn.input('Nombre de la clase: ')
		input = 'make ; java -cp out/ ' .. input .. '\n'
		vim.api.nvim_feedkeys(input, 'n', true)
	else
		print("Not implemented")
	end
end

