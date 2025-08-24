return {
  "nvim-treesitter/nvim-treesitter",

  build = ':TSUpdate',

  event = { "BufReadPre", 'BufNewFile' },

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    vim.keymap.set('n', '<leader>ts', vim.cmd.InspectTree, { desc = '[i]nspect [t]ree' })

    treesitter.setup({
      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          node_decremental = 'grm',
          scope_incremental = 'grc',
        }
      },

      ensure_installed = {
        -- standard
        'bash',
        'markdown',
        'markdown_inline',
        'lua',
        'luadoc',
        'vim',
        'vimdoc',
        'json',
        'jsonc',
        'gitignore',
        'desktop',
        'diff',
        'git_config',
        'git_rebase',
        'http',
        'ssh_config',
        'hyprlang',
        'yaml',

        -- c/c++
        'c',
        'cpp',
        'make',
        'cmake',
        'printf',
        'sql',
      }
    })
  end,
}
