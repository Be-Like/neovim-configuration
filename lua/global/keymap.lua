vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Dismisses the highlighting of the current search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })


-- When in terminal mode, this simplifies how you can exit the mode.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Close the current buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bp<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bn<CR>', { desc = 'Go to next buffer' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go down a window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go up a window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to the reight window' })
