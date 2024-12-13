require'lspconfig'.lua_ls.setup {
  on_attach = require'lsp'.common_on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you are using. LuaJIT for NVIM
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'describe', 'it', 'R', 'P'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      }
    }
  }
}
