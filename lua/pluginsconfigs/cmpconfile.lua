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

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pylsp'].setup {
	root_dir = function(fname)
		return vim.fn.getcwd()
	end,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				mccabe = { enabled = false },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = true },
				pylint = { enabled = false },
			}
		}
	},
}
require('lspconfig')['sqlls'].setup {
	capabilities = capabilities,
	cmd = { "sql-language-server", "up", "--method", "stdio" },
	filetypes = { "sql", "mysql" },
	-- root_dir = function(fname)
	-- 	return vim.fn.getcwd()
	-- end,
	-- settings = {
	-- 	sqlls = {
	-- 		connection = {
	-- 			server = "localhost",
	-- 			database = "AdventureWorks2019",
	-- 			user = "sa",
	-- 			password = "0048728Ckharon",
	-- 			options = {
	-- 				encrypt = false, -- Opciones adicionales de conexión
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- autocompletion = { -- Configuración específica de autocompletado
	-- 	enable = true, -- Habilita el autocompletado
	-- 	triggerCharacters = { ".", " " }, -- Caracteres que desencadenarán el autocompletado
	-- 	keywordInsert = true, -- Insertar automáticamente palabras clave SQL
	-- },
}
require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	cmd = { "clangd","--completion-style=detailed" },
	root_dir = require'lspconfig.util'.root_pattern("makefile", "Makefile", ".git", "*.git"),
}
-- require('lspconfig')['html'].setup {
-- 	cmd = { "vscode-html-language-server", "--stdio" },
-- 	capabilities = capabilities,
-- }

require('lspconfig')['jdtls'].setup {
	capabilities = capabilities,
	root_dir = function(fname)
		return vim.fn.getcwd()
	end,
	cmd = {
		'jdtls',
		'--add-vm-args',
		'-Xmx1G',
		'-Xms100m',
		'-Dorg.eclipse.jdt.ls.taskTags=',
		'-Dorg.eclipse.jdt.ls.taskPriorities='
	},
	filetypes = {'java'},  -- Especifica los tipos de archivo en los que jdtls se activará
	on_attach = function(client)
		-- Acciones adicionales a realizar cuando el servidor LSP se conecta
		print('jdtls is now attached!')
	end,
}
require('lspconfig')['r_language_server'].setup {
	capabilities = capabilities
}

require('lspconfig')['csharp_ls'].setup {
	capabilities = capabilities,
	cmd = { "csharp-ls" },
	filetypes = { "cs" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
root_dir = require'lspconfig'.util.root_pattern('*.git', 'package.json', '*.sln', '.git'),
}

require('lspconfig')['gdscript'].setup {
	capabilities = capabilities
}

require('lspconfig')['ts_ls'].setup {
	capabilities = capabilities,
	cmd = {"typescript-language-server", "--stdio"},
	init_options = {
		preferences = {
			disableSuggestions = true
		}
	},
	root_dir = require'lspconfig.util'.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "app.json"),
	-- root_dir = function(fname)
	-- 	-- Debes especificar el directorio raíz de tu proyecto aquí.
	-- 	return vim.fn.getcwd()
	-- end,
	filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
}

require('lspconfig')['vuels'].setup {
	capabilities = capabilities,
	cmd = { "vls" },
	filetypes = { "vue" },
	init_options = {
		config = {
			css = {},
			emmet = {},
			html = {
				suggest = {}
			},
			javascript = {
				format = {}
			},
			stylusSupremacy = {},
			typescript = {
				format = {}
			},
			vetur = {
				completion = {
					autoImport = false,
					tagCasing = "kebab",
					useScaffoldSnippets = false
				},
				format = {
					defaultFormatter = {
						js = "none",
						ts = "none"
					},
					defaultFormatterOptions = {},
					scriptInitialIndent = false,
					styleInitialIndent = false
				},
				useWorkspaceDependencies = false,
				validation = {
					script = true,
					style = true,
					template = true
				}
			}
		}
	}
}

require('lspconfig')['cssls'].setup {
	capabilities = capabilities,
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
}


require('lspconfig')['asm_lsp'].setup {
	cmd = { "asm-lsp" },
	filetypes = { "asm", "vmasm", "s", "S" },
	root_dir = function(fname)
				return vim.loop.cwd()
		end,
	capabilities = capabilities
}

--local port = os.getenv 'GDScript_Port' or '6005'
--local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))
--require('lspconfig')['gdscript'].setup{
--	cmd = cmd,
--	filetypes = {"gd", "gdscript", "gdscript3"},
--	root_dir = require'lspconfig.util'.root_pattern('project.godot', '.git')
--}

---require('lspconfig')['uiua'].setup {
---	capabilities = capabilities,
---	cmd = { "uiua", "lsp" }
---}
require'lspconfig'.lua_ls.setup {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			})
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
}

require('lspconfig')['bashls'].setup {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh" },
	root_dir = function(fname)
				return vim.loop.cwd()
		end,
	capabilities = capabilities
}


