vim.keymap.del('n', 'gra')
local FunnyQuotes = require('standard.funny_quotes')

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  opts = { inlay_hints = true },
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
      opts = {
        keymap = { preset = 'super-tab' },
        completion = {
          documentation = {
            auto_show = true,
            window = {
                border = {
                    { vim.fn.nr2char(0xf129), "DiagnosticHint" }, -- nf-fa-info icon ""
                    vim.fn.nr2char(0x2500), -- "─"
                    vim.fn.nr2char(0x256e), -- "╮"
                    vim.fn.nr2char(0x2502), -- "│"
                    vim.fn.nr2char(0x256f), -- "╯"
                    vim.fn.nr2char(0x2500), -- "─"
                    vim.fn.nr2char(0x2570), -- "╰"
                    vim.fn.nr2char(0x2502), -- "│"
                }
            }
          },

          menu = {
            scrollbar = false,
            auto_show = true,
            min_width = FunnyQuotes.maxQuoteSize + 2,
            border = {
                { vim.fn.nr2char(0xf140b), "WarningMsg" }, -- nf-md-lightning_bolt icon "󱐋"
                vim.fn.nr2char(0x2500), -- "─"
                vim.fn.nr2char(0x256e), -- "╮"
                vim.fn.nr2char(0x2502), -- "│"
                vim.fn.nr2char(0x256f), -- "╯"
                vim.fn.nr2char(0x2500), -- "─"
                vim.fn.nr2char(0x2570), -- "╰"
                vim.fn.nr2char(0x2502), -- "│"
            }
          },
        },

        signature = {
            window = {
                border = {
                    { vim.fn.nr2char(0xee7f), "SignatureMsg" }, -- nf-fa-signature icon ""
                    vim.fn.nr2char(0x2500), -- "─"
                    vim.fn.nr2char(0x256e), -- "╮"
                    vim.fn.nr2char(0x2502), -- "│"
                    vim.fn.nr2char(0x256f), -- "╯"
                    vim.fn.nr2char(0x2500), -- "─"
                    vim.fn.nr2char(0x2570), -- "╰"
                    vim.fn.nr2char(0x2502), -- "│"
                }
            }
        },

        fuzzy = { implementation = 'lua' },
      },
    },
  },

  config = function()
    vim.diagnostic.config({
        severity_sort = true,
        float = {
            border = {
                { vim.fn.nr2char(0xf129), "DiagnosticHint" }, -- nf-fa-info icon ""
                vim.fn.nr2char(0x2500), -- "─"
                vim.fn.nr2char(0x256e), -- "╮"
                vim.fn.nr2char(0x2502), -- "│"
                vim.fn.nr2char(0x256f), -- "╯"
                vim.fn.nr2char(0x2500), -- "─"
                vim.fn.nr2char(0x2570), -- "╰"
                vim.fn.nr2char(0x2502), -- "│"
            }
        }
    })

    vim.api.nvim_create_autocmd('User', {
        pattern = 'BlinkCmpMenuOpen',
        callback = function()
            local win = require('blink.cmp.completion.windows.menu').win:get_win()
            if win and vim.api.nvim_win_is_valid(win) then
                local title = FunnyQuotes.quotes[math.random(#FunnyQuotes.quotes)]
                vim.api.nvim_win_set_config(win, {
                    title = { { ' ' .. title .. ' ', 'WarningMsg' } },
                    title_pos = 'center'
                })
            end
        end
    })

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
      buf_set_keymap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts('LSP code action'))

      buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts('Format file'))
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover({ border = { { vim.fn.nr2char(0xf129), "DiagnosticHint" }, vim.fn.nr2char(0x2500), vim.fn.nr2char(0x256e), vim.fn.nr2char(0x2502), vim.fn.nr2char(0x256f), vim.fn.nr2char(0x2500), vim.fn.nr2char(0x2570), vim.fn.nr2char(0x2502), }})<CR>', opts('Display the documentation in a hover window'))
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

    vim.lsp.config('rust_analyzer', {
      on_attach = on_attach,
      capabilities = require('blink.cmp').get_lsp_capabilities()
    })

    -- enable the configurations for the various lsp servers so that when I open a buffer one of them can handle they are auto attached
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('rust_analyzer')
  end
}
