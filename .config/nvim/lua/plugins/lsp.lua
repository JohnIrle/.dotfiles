return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('john-lsp-attach', { clear = true }),
      callback = function(event)
        --   end
        --   local opts = { buffer = bufnr, remap = false }

        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
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
        map('<leader>en', function()
          vim.diagnostic.jump { count = 1 }
        end, 'Error Next')
        map('<leader>ep', function()
          vim.diagnostic.jump { count = -1 }
        end, 'Error Previous')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      rust_analyzer = {
        cmd = {
          'rustup',
          'run',
          'stable',
          'rust-analyzer',
        },
        settings = {
          ['rust-analyzer'] = {
            check = { command = 'clippy' },
          },
        },
      },
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`tsserver`) will work just fine
      ts_ls = {},
      clojure_lsp = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
              -- If lua_ls is really slow on your computer, you can try this instead:
              -- library = { vim.env.VIMRUNTIME },
            },
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    require('lspconfig').ocamllsp.setup {}
    require('lspconfig').gleam.setup {}
    require('lspconfig').zls.setup {}

    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})

    require('mason-tool-installer').setup { ensure_installed = { 'stylua' } }

    require('mason-lspconfig').setup {
      ensure_installed = ensure_installed,
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    require('lspconfig').lexical.setup {
      cmd = { vim.fs.normalize '~/Developer/lexical-lsp/lexical/_build/dev/package/lexical/bin/start_lexical.sh' },
      capabilities = capabilities,
    }

    -- Enable inline dianostic messages
    vim.diagnostic.config {
      virtual_text = true,
      float = {
        border = 'solid',
      },
    }
  end,
}
