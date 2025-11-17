-- JavaScript specific keymappings
vim.keymap.set('n', '<leader>jtc', function()
    local current_line = vim.fn.line('.')
    
    local snippet = {
        "try {",
        "} catch (error) {",
        "  throw error;",
        "}"
    }

    vim.api.nvim_buf_set_lines(
        0,
        current_line - 1,
        current_line,
        false,
        snippet
    )

    vim.lsp.buf.format({
        bufnr = 0,
        range = { ['start'] = { current_line, 0 }, ['end'] = { current_line + 5 - 1, 0}}
    })

    local cursor_placement_line = vim.api.nvim_buf_get_lines(0, current_line, current_line + 1, false)[1]
    local cursor_placement = cursor_placement_line:find('}', 1, true)
    vim.api.nvim_win_set_cursor(0, { current_line + 1, cursor_placement - 1})
end, { desc = "Inserts a JavaScript try/catch block"})

