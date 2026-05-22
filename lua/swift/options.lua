local group = vim.api.nvim_create_augroup('SwiftOptions', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = 'swift',
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 0
    vim.bo.shiftwidth = 4
  end,
})
