" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/ vrcnvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'alvan/vim-closetag'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'sheerun/vim-polyglot'
    Plug 'windwp/nvim-autopairs'
    Plug 'mhinz/vim-startify'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'simrat39/rust-tools.nvim'

    " Styles
    Plug 'morhetz/gruvbox'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'akinsho/bufferline.nvim'

    " Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'

    " Lsp, autocomplete, formatting
    Plug 'neovim/nvim-lspconfig'
    Plug 'onsails/lspkind-nvim'
    Plug 'sbdchd/neoformat'
    Plug 'kosayoda/nvim-lightbulb'

    " CMP
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'


    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'junegunn/gv.vim'
    Plug 'vim-utils/vim-man'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'christoomey/vim-system-copy'

call plug#end()
