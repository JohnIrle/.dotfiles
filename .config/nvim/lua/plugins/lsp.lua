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
        map('[d', vim.diagnostic.goto_next, 'Next Diagnostic')
        map(']d', vim.diagnostic.goto_prev, 'Previous Diagnostic')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        print(client)
        if client and client.server_capabilities.documentHighlightProvider then
          -- local function documentHighlight(client)
          --   vim.api.nvim_exec(
          --     [[
          -- hi LspReferenceRead cterm=bold ctermbg=red guibg=#504945
          -- hi LspReferenceText cterm=bold ctermbg=red guibg=#504945
          -- hi LspReferenceWrite cterm=bold ctermbg=red guibg=#504945
          -- augroup lsp_document_highlight
          -- autocmd! * <buffer>
          -- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          -- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          -- augroup END
          -- ]],
          --     false
          --   )
          -- end
          -- documentHighlight(client)
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
      },
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`tsserver`) will work just fine
      tsserver = {},
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

    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
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

    -- Enable inline dianostic messages
    vim.diagnostic.config {
      virtual_text = true,
    }
  end,
}

-- lsp.on_attach(function(client, bufnr)
-- end)

-- require('mason-lspconfig').setup {
--   handlers = {
--     lsp.default_setup,
--     lua_ls = function()
--       local lua_opts = {
--         settings = {
--           Lua = {
--             runtime = {
--               -- Tell the language server which version of Lua you are using. LuaJIT for NVIM
--               version = 'LuaJIT',
--               -- Setup your lua path
--               path = vim.split(package.path, ';'),
--             },
--             diagnostics = {
--               -- Get the language server to recognize the `vim` global
--               globals = { 'vim', 'describe', 'it', 'R', 'P' },
--             },
--             workspace = {
--               -- Make the server aware of Neovim runtime files
--               library = {
--                 [vim.fn.expand '$VIMRUNTIME/lua'] = true,
--                 [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
--               },
--             },
--           },
--         },
--       }
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   },
--   rust_analyzer = function()
--     require('rust-tools').setup()
--     require('lspconfig').rust_analyzer {
--     }
--   end,
-- }

-- lsp.setup()

-- end,
-- },
-- }
