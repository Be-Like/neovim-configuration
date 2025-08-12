return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '-' },
            topdelete = { text = '-' },
            changedelete = { text = '-' },
        },

        current_line_blame = false,
        current_line_blame_opts = {
            virt_text_pos = 'eol'
        },

        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggles the git blame' })
        end,
    },
}

