-- nvim.tree --
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	auto_reload_on_write = true,
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	respect_buf_cwd = false,
	view = {
		width = 30,
		number = true,
		relativenumber = true,
		adaptive_size = false,
--		mappings = {
--			list = {
--				{ key = "u", action = "dir_up" },
--				{ key = " ", action = "dir_down" },
--				{ key = "C", action = "cd" },
--			},
--		},
	},
	renderer = {
		root_folder_label = false,
		group_empty = true,
		indent_width = 2,
		highlight_git = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "",
				},
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	filters = {
		dotfiles = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	system_open = {
		cmd = "thunar",
		args = {},
	},
})
-- require("nvim-tree.api").tree.open()

-- icon colors --
require'nvim-web-devicons'.get_icons()
require'nvim-web-devicons'.setup {
	-- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
	   Dir = {
	   	icon = "",
	   	color = "#428850",
	   	cterm_color = "65",
	   	name = "Dir"
	   }
	};
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true;
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true;
}

