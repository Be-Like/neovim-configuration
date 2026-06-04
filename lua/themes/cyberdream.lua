return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        local opts = {
            variant = "default",
            transparent = true,
            saturation = 1,
            italic_comments = true,
            hide_fillchars = false,
            borderless_pickers = true, -- don't think I actually want this
            terminal_colors = true,
            cache = false,
            -- hightlights = {}
            overrides = function(colors)
                return {}
            end,
            -- colors = {} -- see lua/cyberdream/colours.lua for full list
            extensions = {
                telescope = true,
                notify = true,
                mini = true
            }
        }

        require('cyberdream').setup(opts)

        vim.cmd.colorscheme 'cyberdream'

        -- Keybind for toggling the color scheme
        vim.keymap.set('n', '<leader>tt', function()
            opts.transparent = not opts.transparent
            require('cyberdream').setup(opts)
            vim.cmd.colorscheme 'cyberdream'
            vim.notify('Transparency ' .. (opts.transparent and 'on' or 'off'))
        end, { noremap = true, silent = true, desc = 'Toggle Transparency' })
    end
}

