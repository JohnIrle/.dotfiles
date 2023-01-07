vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.cmdheight = 2
vim.opt.pumheight = 10
vim.opt.pumblend = 15
vim.opt.ruler = true
vim.opt.iskeyword:append("-")
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.conceallevel = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.laststatus = 0
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.updatetime = 50

vim.opt.formatoptions:remove("cro")
vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
