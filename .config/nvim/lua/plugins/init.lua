require("plugins.telescope")
require("plugins.devicons")
require("plugins.plug-colorizer")
require("plugins.compe")
require("plugins.gitsigns")
require("plugins.nvim-lightbulb")

require('nvim-autopairs').setup()

require'nvim-treesitter.configs'.setup {highlight = {enable = true}}
