-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'alvan/vim-closetag'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  -- use 'sheerun/vim-polyglot'
  use 'windwp/nvim-autopairs'
  use 'mhinz/vim-startify'
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'simrat39/rust-tools.nvim'

  use 'nanotee/luv-vimdocs'
  use 'milisims/nvim-luaref'

  -- Styles
  use 'morhetz/gruvbox'
  use 'tomasr/molokai'
  use 'hoob3rt/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Lsp, autocomplete, formatting
  use 'onsails/lspkind-nvim'
  use 'sbdchd/neoformat'
  use 'kosayoda/nvim-lightbulb'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'}, -- Autocompletion
      {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'}, -- Snippets
      {'L3MON4D3/LuaSnip'}, -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'}
    }
  }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'junegunn/gv.vim'
  use 'vim-utils/vim-man'
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-system-copy'
  use 'dstein64/vim-startuptime'

  use '~/Developer/JohnIrle/stackmaps.nvim/'

end)
