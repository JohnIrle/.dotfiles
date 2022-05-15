source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/colors.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim
source $HOME/.config/nvim/plug-config/neoformat.vim

lua require('packer-plugins')
lua require('globals');
lua require('plugins')
lua require('lsp')
lua require('lsp.python-ls')
lua require('lsp.lua-ls')
lua require('lsp.docker-ls')
lua require('lsp.go-ls')
lua require('lsp.vim-ls')
lua require('lsp.typescript-ls')
lua require('lsp.diagnostic-ls')
lua require('lsp.rust-ls')
lua require('lsp.css-ls')
lua require('lsp.html-ls')
lua require('lsp.clangd-ls')
lua require('lsp.vue-ls')
lua require('lsp.ruby-ls')

