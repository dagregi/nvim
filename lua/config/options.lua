local o, opt = vim.o, vim.opt

--leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
o.wrap = false
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true

-- line
o.number = true
o.relativenumber = true

o.cursorline = true

-- display
o.signcolumn = "yes"

o.termguicolors = true

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.autowrite = true
opt.clipboard = "unnamedplus"

-- yanked from ThePrimeagen
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"
