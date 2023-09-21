--preview--
require("image_preview").setup({})

---load config files for plugins
require('pluginsconfigs.lualineconfile')
require('pluginsconfigs.cmpconfile')
require('pluginsconfigs.nvimtreeconfile')
require('pluginsconfigs.treesitterconfile')
require('pluginsconfigs.telescopeconfile')


-- load my own configs
require('myconfs.ecosystem')

vim.opt.laststatus = 3;
