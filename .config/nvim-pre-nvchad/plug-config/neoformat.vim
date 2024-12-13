augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

let g:neoformat_lua_luaformat = {
        \ 'exe': 'lua-format',
        \ 'args': [
        \  "-i",
        \  "--no-keep-simple-function-one-line",
        \  "--no-keep-simple-control-block-one-line",
        \  "--break-after-operator",
        \  "--break-after-table-lb",
        \  "--column-limit=150",
        \  "--indent-width=2",
        \  "--no-use-tab"
        \ ],
        \ 'stdin': 1,
        \ }

let g:neoformat_enabled_lua = ['luaformat']
