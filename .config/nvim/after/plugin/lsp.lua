require('lspkind').init()
local lsp = require 'lsp-zero'
lsp.preset 'recommended'

local ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer', 'stylua' }

require('mason').setup {}
require('mason-lspconfig').setup {
  handlers = {
    lsp.default_setup,
  },
}
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you are using. LuaJIT for NVIM
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'describe', 'it', 'R', 'P' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
        },
      },
    },
  },
})

require('rust-tools').setup()

lsp.configure('rust_analyzer', {
  cmd = {
    'rustup',
    'run',
    'stable',
    'rust-analyzer',
  },
})

local lspkind = require 'lspkind'
lspkind.init()
local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

cmp.setup {
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete { behavior = cmp.ConfirmBehavior.Replace, select = true },
    ['<CR>'] = cmp.mapping.confirm(),
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

local function documentHighlight(client)
  -- Set autocommands conditional on server_capabilities
  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=#504945
    hi LspReferenceText cterm=bold ctermbg=red guibg=#504945
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=#504945
    augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]],
      false
    )
  end
end

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  documentHighlight(client)

  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  map('<leader>h', vim.lsp.buf.signature_help, 'Signature [H]elp')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('<leader>vd', vim.diagnostic.open_float, 'Diasnotic Float')
  map('[d', vim.diagnostic.goto_next, 'Next Diagnostic')
  map(']d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
end)

lsp.setup()

-- Enable inline dianostic messages
vim.diagnostic.config {
  virtual_text = true,
}
