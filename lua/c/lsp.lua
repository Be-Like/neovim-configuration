vim.keymap.del('n', 'gra')

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      'hrsh7th/cmp-nvim-lsp',
      branch = 'main',
      dependencies = {
        { 'hrsh7th/nvim-cmp', branch = 'main' }
      }
    },
    {
      "j-hui/fidget.nvim",
      opts = {
        -- options
      },
    },
    {
      'saghen/blink.cmp',
      version = '1.6.0',
      build = 'cargo build --release',
      opts = {
        keymap = { preset = 'default' },
        completion = {
          documentation = {
            auto_show = true,
          },

          menu = {
            auto_show = false,
          },
        },
        fuzzy = { implementation = 'lua' },
      },
    },
  },

  config = function()
    vim.diagnostic.config({ severity_sort = true })

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- local opts = { noremap = true, silent = true, desc = 'This is a description' }
      local opts = function(description)
        return { noremap = true, silent = true, desc = description }
      end

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'grd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts('Go to definition'))
      buf_set_keymap('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts('View implementation'))
      buf_set_keymap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<CR>', opts('View references'))
      buf_set_keymap('n', 'grD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts('Go to declaration'))
      buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts('Rename'))
      buf_set_keymap('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts('Go to type definition'))

      buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts('Format file'))
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts('Display the documentation in a hover window'))
    end

    -- configure the various different lsp servers that I use
    vim.lsp.config('lua_ls', {
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' }
          }
        }
      }
    })

    vim.lsp.config('clangd', {
      on_attach = on_attach
    })

    -- enable the configurations for the various lsp servers so that when I open a buffer one of them can handle they are auto attached
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('clangd')

    -- vim.api.nvim_create_autocmd("BufWritePre", {
    -- 	pattern = { "*.ts" },
    -- 	command = "EslintFixAll",
    -- })

    -- vim.api.nvim_create_autocmd('BufWritePre', {
    -- 	pattern = '*',
    -- 	command = 'lua vim.lsp.buf.format()'
    -- })
  end
}
