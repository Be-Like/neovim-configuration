return {
  "nvim-treesitter/nvim-treesitter",
  
  lazy = false,
  
  build = ':TSUpdate',
  
  event = { "BufReadPre", 'BufNewFile' },
  
  config = function()
    local treesitter = require("nvim-treesitter")

    vim.keymap.set('n', '<leader>it', vim.cmd.InspectTree, { desc = '[i]nspect [t]ree' })

    -- 1. Setup your isolated parser directory
    treesitter.setup({
      install_dir = vim.fn.stdpath('data') .. '/lazy-javascript/site',
    })

    -- 2. Define the parsers you need
    local parsers = {
        -- standard
        'bash',
        'markdown',
        'markdown_inline',
        'lua',
        'luadoc',
        'vim',
        'vimdoc',
        'json',
        'gitignore',
        'desktop',
        'diff',
        'git_config',
        'git_rebase',
        'http',
        'ssh_config',
        'hyprlang',

        -- javascript
        'javascript',
        'jsdoc',
        'typescript',
        'tsx',
        'yaml',
        'vue',
        'html',
        'css',
        'scss',
        'sql',
      }

    -- 3. Install parsers imperatively
    treesitter.install(parsers)

    -- 4. Enable Neovim's native highlighting via autocommand
    local group = vim.api.nvim_create_augroup('CustomTreesitterSetup', { clear = true })

    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = '*',
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
