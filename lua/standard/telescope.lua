return {
    'nvim-telescope/telescope.nvim', tag='0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                initial_mode = 'normal',
            }
        })


        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[s]earch [s]elect telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch by [g]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[s]earch [r]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] find existing buffers' })
    end
}

