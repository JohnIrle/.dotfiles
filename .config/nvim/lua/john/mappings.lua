vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<Down>', '<cmd>:resize +2<cr>', { desc = 'Vertical Increase' })
vim.keymap.set('n', '<Up>', '<cmd>:resize -2<cr>', { desc = 'Vertical Decrease' })
vim.keymap.set('n', '<Left>', '<cmd>:vertical resize -2<cr>', { desc = 'Horizontal Descrease' })
vim.keymap.set('n', '<Right>', '<cmd>:vertical resize +2<cr>', { desc = 'Horzontal Increase' })

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set('i', 'jk', '<ESC>')

-- Easy CAPS
vim.keymap.set('i', '<c-u>', '<ESC>viwUi')
vim.keymap.set('n', '<c-u>', 'viwU<ESC>')

-- TAB in general mode will move to text buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>', { desc = 'Next Buffer' })
-- SHIFT-TAB will go back
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { desc = 'Previous Buffer' })

-- Use control-c instead of escape
vim.keymap.set('n', '<C-c>', '<Esc>')

-- Better tabbing
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- More logical Yank
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'y', 'y+')

-- keep cursor centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', 'o', 'o<Esc>^Da')
vim.keymap.set('n', 'O', 'O<Esc>^Da')
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = 'Format' })

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Regex Replace' })
vim.keymap.set('n', '<leader>fx', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make Executable' })

vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile', { desc = 'Plenary Test' })
