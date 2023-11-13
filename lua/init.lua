-- load my own configs
require('myconfs.createTermprog')
require('myconfs.ecosystem')
require('myconfs.compileconf')
require('myconfs.keybinds')

---load config files for plugins
require('pluginsconfigs.treesitterconfile')
require('pluginsconfigs.lualineconfile')
require('pluginsconfigs.cmpconfile')
require('pluginsconfigs.nvimtreeconfile')
require('pluginsconfigs.telescopeconfile')
require('pluginsconfigs.neorgconfile')
require('pluginsconfigs.todonotesconfile')
require('pluginsconfigs.adbodconfile')
require('pluginsconfigs.telescoperepoconfile')
require('pluginsconfigs.cellularautomatonconfile')





vim.opt.laststatus = 3;

