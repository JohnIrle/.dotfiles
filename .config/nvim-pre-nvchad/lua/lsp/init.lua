require('lspkind').init()
require('lsp.sign-overides')

local function documentHighlight(client)
  -- Set autocommands conditional on server_capabilities
  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=#504945
    hi LspReferenceText cterm=bold ctermbg=red guibg=#504945
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=#504945
    augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]], false)
  end

end

local lsp_config = {}

function lsp_config.add_snippet_capabilites()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {properties = {'documentation', 'detail', 'additionalTextEdits'}}
  return capabilities
end

function lsp_config.common_on_attach(client, bufnr)
  documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
  lsp_config.common_on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
return lsp_config
