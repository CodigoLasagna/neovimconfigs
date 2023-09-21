--preview--
require("image_preview").setup({})
-- vim.tree --
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1


-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	prefer_startup_root = true,
	auto_reload_on_write = true,
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

-- lualine --
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- cmp --
local cmp = require'cmp'
require'colorizer'.setup()

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		{ name = 'path' },
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pylsp'].setup {
	settings = {
		pylsp = {
			plugins = {
				mccabe = { enabled = false },
				pycodestyle = { enabled = true },
				pyflakes = { enabled = true },
				pylint = { enabled = false },
			}
		}
	},
	capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	cmd = { "clangd","--completion-style=detailed" }
}
require('lspconfig')['html'].setup {
	cmd = { "vscode-html-language-server", "--stdio" },
	capabilities = capabilities,
}
require('lspconfig')['jdtls'].setup {
	capabilities = capabilities,
	root_dir = function(fname)
		return vim.fn.getcwd()
	end,
}
require('lspconfig')['r_language_server'].setup {
	capabilities = capabilities
}

require('lspconfig')['gdscript'].setup {
	capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
	capabilities = capabilities,
	init_options = {
	    preferences = {
	        disableSuggestions = true
	    }
	}
}
require('lspconfig')['asm_lsp'].setup {
	cmd = { "asm-lsp" },
	filetypes = { "asm", "vmasm", "s", "S" },
	root_dir = function(fname)    
        return vim.loop.cwd()
    end,
	capabilities = capabilities
}
vim.opt.laststatus = 3;

------- TreeSitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
---    disable = function(lang, buf)
---        local max_filesize = 100 * 1024 -- 100 KB
---        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
---        if ok and stats and stats.size > max_filesize then
---            return true
---        end
---    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

------- my functions ----

function get_hostname()
  local status, hostname = pcall(vim.loop.os_gethostname)
  if status then
    return hostname
  else
    return nil
  end
end

local hostname = get_hostname()

if hostname then
  if hostname == "LEGION" then
    vim.cmd('colorscheme eros_net')
  elseif hostname == "EONIX" then
    vim.cmd('colorscheme neohub')
  else
    vim.cmd('colorscheme quiet')
  end
end
