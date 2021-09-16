local cmp = require 'cmp'

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  sources = {{name = 'nvim_lsp'}, {name = 'buffer'}, {name = "nvim_lua"}, {name = "vsnip"}},
  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t '<C-n>', 'n')
      elseif check_back_space() then
        vim.fn.feedkeys(t '<Tab>', 'n')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t '<C-p>', 'n')
      else
        fallback()
      end
    end
  },
  formatting = {
    format = function(entry, vim_item)
      -- icons
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      vim_item.menu = ({buffer = "[Buffer]", nvim_lsp = "[LSP]", nvim_lua = "[Lua]"})[entry.source.name]
      return vim_item
    end
  }
}

require('nvim-autopairs.completion.cmp').setup({map_cr = true, map_complete = true, auto_select = true})
