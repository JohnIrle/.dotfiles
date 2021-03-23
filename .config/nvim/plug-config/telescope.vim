lua require("plugins")

  nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>pe :lua require('telescope.builtin').file_browser()<CR>
nnoremap <leader>vrc :lua require('plugins.telescope').search_dotfiles()<CR>
nnoremap <leader>va  :lua require('plugins.telescope').anime_selector()<CR>
