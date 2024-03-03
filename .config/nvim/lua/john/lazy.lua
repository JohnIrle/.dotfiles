-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({

  'alvan/vim-closetag',
  'leafgarland/typescript-vim',
  'peitalin/vim-jsx-typescript',
  'sheerun/vim-polyglot',
  'windwp/nvim-autopairs',
  'mhinz/vim-startify',
  'norcalli/nvim-colorizer.lua',
  'lewis6991/gitsigns.nvim',
  'simrat39/rust-tools.nvim',

  'nanotee/luv-vimdocs',
  'milisims/nvim-luaref',
  'nkrkv/nvim-treesitter-rescript',
  'rescript-lang/vim-rescript',

  -- Styles
  'morhetz/gruvbox',
  'hoob3rt/lualine.nvim',
  'akinsho/bufferline.nvim',

  -- Icons
  'kyazdani42/nvim-web-devicons',
  'ryanoasis/vim-devicons',

  -- Lsp, autocomplete, formatting
  'onsails/lspkind-nvim',
  'sbdchd/neoformat',
  'kosayoda/nvim-lightbulb',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  
  'VonHeikemen/lsp-zero.nvim',
  'neovim/nvim-lspconfig', 
  'hrsh7th/nvim-cmp', 
  'hrsh7th/cmp-buffer', 
  'hrsh7th/cmp-path', 
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua', -- Snippets
  'L3MON4D3/LuaSnip', -- Snippet Collection (Optional)
  'rafamadriz/friendly-snippets',

  -- Telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',

  {'nvim-treesitter/nvim-treesitter', build = 'TSUpdate'},
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-commentary',
  'tpope/vim-dispatch',
  'junegunn/gv.vim',
  'vim-utils/vim-man',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-system-copy',
  -- use 'dstein64/vim-startuptime'

  -- use '~/Developer/JohnIrle/stackmaps.nvim/'

})
