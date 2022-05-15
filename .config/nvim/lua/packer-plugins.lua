local fn = vim.fn
-- Automatically intall packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Reload neovim whenever you save packerfile
-- vim.cmd [[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost packer.lua source <afile> | PackerSync
--     augroup end
-- ]]

-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then return end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'alvan/vim-closetag'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'sheerun/vim-polyglot'
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
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'sbdchd/neoformat'
  use 'kosayoda/nvim-lightbulb'

  -- CMP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
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

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
