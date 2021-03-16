augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:neoformat_lua_luaformat = {
        \ 'exe': 'lua-format',
        \ 'args': [
        \  "-i",
        \  "--no-keep-simple-function-one-line",
        \  "--no-break-after-operator",
        \  "--break-after-table-lb",
        \  "--column-limit=150",
        \  "--indent-width=2",
        \  "--no-use-tab"
        \ ],
        \ 'stdin': 1,
        \ }

let g:neoformat_enabled_lua = ['luaformat']
