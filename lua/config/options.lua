local o, opt = vim.o, vim.opt
--leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Indentation
o.wrap = false
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = false
-- line
o.number = true
o.relativenumber = true
o.cursorline = true
opt.guicursor = ""
-- display
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "80"
o.termguicolors = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.autowrite = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.updatetime = 50
