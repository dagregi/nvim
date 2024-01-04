local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "
opt.wrap = false
opt.shiftwidth = 0
opt.tabstop = 4
opt.softtabstop = -1
opt.expandtab = false
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.guicursor = ""
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "80"
opt.termguicolors = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.autowrite = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.updatetime = 50
-- netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search", default = true })
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
