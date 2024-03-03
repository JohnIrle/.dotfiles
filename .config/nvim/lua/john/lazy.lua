local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup {

  'alvan/vim-closetag',
  'leafgarland/typescript-vim',
  'peitalin/vim-jsx-typescript',
  'sheerun/vim-polyglot',
  'windwp/nvim-autopairs',
  'norcalli/nvim-colorizer.lua',
  'lewis6991/gitsigns.nvim',
  'simrat39/rust-tools.nvim',

  'nanotee/luv-vimdocs',
  'milisims/nvim-luaref',

  -- Styles
  'morhetz/gruvbox',
  'hoob3rt/lualine.nvim',
  'akinsho/bufferline.nvim',

  {
    'goolord/alpha-nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      local startify = require 'alpha.themes.startify'

      startify.section.header.val = {
        '     █████████   █████                         █████     ',
        '    ███░░░░░███ ░░███                         ░░███      ',
        '   ░███    ░░░  ███████    ██████   ████████  ███████    ',
        '   ░░█████████ ░░░███░    ░░░░░███ ░░███░░███░░░███░     ',
        '    ░░░░░░░░███  ░███      ███████  ░███ ░░░   ░███      ',
        '    ███    ░███  ░███ ███ ███░░███  ░███       ░███ ███  ',
        '   ░░█████████   ░░█████ ░░████████ █████      ░░█████   ',
        '   ░░░░░░░░░     ░░░░░   ░░░░░░░░ ░░░░░        ░░░░░     ',
      }
      require('alpha').setup(startify.opts)
    end,
  },
  'ryanoasis/vim-devicons',

  -- Lsp, autocomplete, formatting
  'onsails/lspkind-nvim',
  'sbdchd/neoformat',
  'kosayoda/nvim-lightbulb',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',

  'VonHeikemen/lsp-zero.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua', -- Snippets
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  'rafamadriz/friendly-snippets',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      {
        'nvim-telescope/telescope-fzy-native.nvim',
        build = make,

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  { 'nvim-treesitter/nvim-treesitter', build = 'TSUpdate' },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-commentary',
  'tpope/vim-dispatch',
  'junegunn/gv.vim',
  'vim-utils/vim-man',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-system-copy',
}
