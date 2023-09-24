--preview--
--require("image_preview").setup({})

---load config files for plugins
require('pluginsconfigs.treesitterconfile')
require('pluginsconfigs.lualineconfile')
require('pluginsconfigs.cmpconfile')
require('pluginsconfigs.nvimtreeconfile')
require('pluginsconfigs.telescopeconfile')
require('pluginsconfigs.neorgconfile')
require('pluginsconfigs.todonotesconfile')


-- load my own configs
require('myconfs.ecosystem')
require('myconfs.compileconf')
require('myconfs.keybinds')

vim.opt.laststatus = 3;

