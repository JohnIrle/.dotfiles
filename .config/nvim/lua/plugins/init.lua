require("plugins.telescope")
require("plugins.devicons")
require("plugins.plug-colorizer")
require("nvim-autopairs").setup()
require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.nvim-lightbulb")
require("plugins.lines")

require'nvim-treesitter.configs'.setup {highlight = {enable = true}}
