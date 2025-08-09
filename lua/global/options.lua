vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 1000

vim.opt.colorcolumn = "120"

-- Disables mouse click actions (I want to be fully reliant on the keyboard)
vim.o.mouse = ""

-- Disables the mode within the bottom most gutter (this will be displayed via a different tool)
vim.o.showmode = false

-- Keeps blocks of text indented if a line wrap occurs, keeping a visual block of text.
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters are present
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

vim.o.confirm = true

