function ToggleTerminal(root_dir, command)
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
        if terminal_winid ~= -1 then
            -- Cambiar a la ventana de la terminal
            vim.cmd(terminal_winid .. 'wincmd p')
        end
    else
        -- Abrir una nueva terminal
        vim.cmd('botright split')
        vim.cmd(work_dir)
        vim.cmd(command and 'term ' .. command or 'term')
        vim.cmd('resize ' .. vim.fn.winheight(0) / 2)
        vim.cmd('startinsert')
    end
end
