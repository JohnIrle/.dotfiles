local on_attach = require'completion'.on_attach

local filetypes = {javacript = "eslint", javascriptreact = "eslint", typescript = "eslint", typescriptreact = "eslint", lua = "lua", css = "css"}

local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}

local formatters = {
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}},
  luaformat = {
    command = "lua-format",
    args = {
      "-i", "--no-keep-simple-function-one-line", "--no-break-after-operator", "--break-after-table-lb", "--column-limit=150", "--indent-width=2",
      "--no-use-tab"
    }
  }
}

local formatFiletypes = {typescript = "prettier", typescriptreact = "prettier", css = "prettier", lua = "luaformat"}

require'lspconfig'.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {filetypes = filetypes, linters = linters, formatters = formatters, formatFiletypes = formatFiletypes}
}

require'lspconfig'.tsserver.setup {on_attach = on_attach}
