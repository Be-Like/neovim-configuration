return {
    'vim-test/vim-test',
    config = function ()
		vim.g['test#strategy'] = 'neovim'
		vim.g['test#neovim#term_position'] = 'vert'
		-- vim.g['test#custom_runners'] = { dart = { 'vgvtest' } }

		vim.keymap.set('n', '<leader>tc', '<cmd>:TestNearest<CR>', { silent = true })
		vim.keymap.set('n', '<leader>tf', '<cmd>:TestFile<CR>', { silent = true })
		vim.keymap.set('n', '<leader>ts', '<cmd>:TestSuite<CR>', { silent = true })
		vim.keymap.set('n', '<leader>tl', '<cmd>:TestLast<CR>', { silent = true })
		vim.keymap.set('n', '<leader>tv', '<cmd>:TestVisit<CR>', { silent = true })
	end
}

