require("telescope").setup {
	extensions = {
		repo = {
			list = {
				fd_opts = {
					"--no-ignore-vcs",
				},
				search_dirs = {
					"~/.config/",
					Main_workingdir,
				},
			},
		},
	},
}

require("telescope").load_extension "repo"
