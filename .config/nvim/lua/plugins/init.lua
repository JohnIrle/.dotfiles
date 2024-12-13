return {
  {
    'alvan/vim-closetag',
    config = function()
      vim.g.closetag_xhtml_filenames = '*.jsx,*.tsx'
      vim.g.closetag_filetypes = 'html, javascriptreact, typescriptreact'
      vim.g.closetag_xhtml_filetypes = 'jsx,tsx'
      vim.g.closetag_emptyTags_caseSensitive = 0
    end,
  },
  'leafgarland/typescript-vim',
  'peitalin/vim-jsx-typescript',
  'sheerun/vim-polyglot',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ '*' }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  'milisims/nvim-luaref',
  'ryanoasis/vim-devicons',
  {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        -- follow latest release.
        version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = 'make install_jsregexp',
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua', -- Snippets
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    },
    config = function()
      local lspkind = require 'lspkind'
      lspkind.init()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-e>'] = cmp.mapping.close(),
          ['<C-Space>'] = cmp.mapping.complete { behavior = cmp.ConfirmBehavior.Replace, select = true },
          ['<CR>'] = cmp.mapping.confirm(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              buffer = '[buf]',
              nvim_lsp = '[LSP]',
              nvim_lua = '[api]',
              path = '[path]',
              luasnip = '[snip]',
              gh_issues = '[issues]',
            },
          },
        },
        experimental = { native_menu = false, ghost_text = true },
      }

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
    end,
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
      vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>')
      vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>')
    end,
  },
  { 'numToStr/Comment.nvim', opts = {} },
  'tpope/vim-rhubarb',
  'tpope/vim-dispatch',
  'junegunn/gv.vim',
  'vim-utils/vim-man',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-system-copy',
}
