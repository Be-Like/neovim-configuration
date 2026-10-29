vim.g.have_nerd_font = false

-- Create an autocommand to apply these matches when a buffer is opened or syntax is reapplied
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Define your custom highlight groups
        vim.api.nvim_set_hl(
            0,
            "CommentNote",
            { fg = "#98c379", bold = true, italic = true }
        )

        vim.api.nvim_set_hl(
            0,
            "CommentStudy",
            { fg = "#61afef", bold = true, italic = true }
        )

        vim.api.nvim_set_hl(
            0,
            "CommentImportant",
            { fg = "#e5c07b", bold = true, italic = true }
        )

        vim.api.nvim_set_hl(
            0,
            "CommentFix",
            { fg = "#e06c75", bold = true }
        )

        vim.api.nvim_set_hl(
            0,
            "CommentTodo",
            { fg = "#ff9e64", bold = true }
        )

        vim.api.nvim_set_hl(
            0,
            "CommentJake",
            { fg = "#bd93f9", bold = true, italic = true }
        )
    end,
})

-- Apply the highlights when entering a buffer or window
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    pattern = "*",
    callback = function()
        -- Case-insensitive (\c) ONLY at the beginning of a comment
        -- Breaking down the regex:
        -- ^[ \t]*          : Matches start of line and any leading whitespace
        -- \\(//\\|/\\*\\|\\*\\) : Matches standard C/C++ comment markers: //, /*, or *
        -- \\s*             : Matches optional trailing whitespace after the comment marker
        -- \\zs             : Tells Neovim to START the actual highlight here
        -- \\c\\<important\\> : Matches the word case-insensitively
        vim.fn.matchadd("CommentFix", "^[ \\t]*\\(//\\|/\\*\\|\\*\\)\\s*\\zs\\c\\<fix\\>")
        vim.fn.matchadd("CommentNote", "^[ \\t]*\\(//\\|/\\*\\|\\*\\)\\s*\\zs\\c\\<note\\>")
        vim.fn.matchadd("CommentStudy", "^[ \\t]*\\(//\\|/\\*\\|\\*\\)\\s*\\zs\\c\\<study\\>")
        vim.fn.matchadd("CommentImportant", "^[ \\t]*\\(//\\|/\\*\\|\\*\\)\\s*\\zs\\c\\<important\\>")
        vim.fn.matchadd("CommentTodo", "^[ \\t]*\\(//\\|/\\*\\|\\*\\)\\s*\\zs\\c\\<todo\\>")
        vim.fn.matchadd("CommentJake", "\\(//\\|/\\*\\|\\*\\).*\\zs\\c\\<jake\\>")
    end,
})
