require'lspconfig'.pyright.setup {
  on_attach = require'lsp'.common_on_attach,
  cmd = {"pyright-langserver", "--stdio"},
  filetypes = {"python"},
  settings = {python = {analysis = {autoSearchPaths = true, useLibraryCodeForTypes = true}}}
}
