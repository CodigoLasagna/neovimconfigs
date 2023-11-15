function CloseWin()
	vim.cmd('b#')
	vim.cmd('bd#')
end

---- Movement ----
-- normal --
vim.api.nvim_set_keymap('n', 'h', ';', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', 'l', { noremap = true, silent = true })
-- visual --
vim.api.nvim_set_keymap('v', 'h', ';', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';', 'l', { noremap = true, silent = true })
---- panes ----
-- move between panes --
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-;>', '<C-w>l', { noremap = true, silent = true })
-- create panes --
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-v>', '<C-w>v', { noremap = true, silent = true })
-- close pane
vim.api.nvim_set_keymap('n', '<A-q>', ':close<CR>', { noremap = true, silent = true })
-- resize panes --
vim.api.nvim_set_keymap('n', '<A-a>j', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-a>k', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-a>l', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-a>;', ':vertical resize -5<CR>', { noremap = true, silent = true })
-- close --
vim.api.nvim_set_keymap('n', '<A-q>;', ':close<CR>', { noremap = true, silent = true })
---- buffers ----
--close buffer --
vim.api.nvim_set_keymap('n', '<C-w>', ':lua CloseWin()<CR>', { noremap = true, silent = true })
-- change between buffers --
vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', { noremap = true, silent = true })
-- leave insert/term mode --
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })
---- Close everything ----
-- fkc it close everything --
vim.api.nvim_set_keymap('n', '<C-c>', ':wqa<CR>', { noremap = true, silent = true })
-- exit term mode --
vim.api.nvim_set_keymap('n', '<Esc>', ':<C-\\><C-n>', { noremap = true, silent = true })


-- Compile --
vim.api.nvim_set_keymap('n', '<C-b>', ':lua Compile()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-t>', ':<C-\\><C-n><Bar>:lua ToggleTerminal()<CR>', { noremap = true, silent = true })

---LEADER
vim.g.mapleader = ","
