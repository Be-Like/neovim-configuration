require('javascript/options')

local lazypath = vim.fn.stdpath("data") .. "/lazy-javascript/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    root = vim.fn.stdpath('data') .. '/lazy-javascript',
    lockfile = vim.fn.stdpath('config') .. '/lua/javascript/lazy-lock.json',

    spec = {
        require('themes.tokyonight'),
        require('standard.oil'),
        require('standard.telescope'),
        require('standard.whichkey'),
        require('standard.quickfixpreview'),
        require('standard.mini'),
        require('standard.autopairs'),
        require('shared_plugins.gitsigns'),
        require('javascript.lsp'),
        require('javascript.ripgrep'),
        require('javascript.treesitter'),
    }
})
