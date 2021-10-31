local lspkind = require 'lspkind'
lspkind.init()

local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  sources = {{name = "gh_issues"}, {name = "nvim_lua"}, {name = 'nvim_lsp'}, {name = "vsnip"}, {name = 'buffer', keyword_lenth = 5}},
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ['<CR>'] = cmp.mapping.confirm()
    -- ["<Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ["<S-Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {buffer = "[buf]", nvim_lsp = "[LSP]", nvim_lua = "[api]", path = "[path]", vsnip = "[snip]", gh_issues = "[issues]"}
    }
  }
}

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
