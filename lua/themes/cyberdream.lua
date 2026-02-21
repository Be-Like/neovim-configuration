return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require('cyberdream').setup {
            variant = "default",
            transparent = false,
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

        vim.cmd.colorscheme 'cyberdream'
    end
}

