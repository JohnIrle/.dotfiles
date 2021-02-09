map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
noremap <leader>g :Rg<CR>

nnoremap <leader>gc :GBranches<CR>

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
