local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("config.keymaps")
require("config.autocmds").setup()
require("config.utils").lazy_file()
require("lazy").setup({
	spec = "plugins",
	defaults = { lazy = true },
	change_detection = { notify = false },
	performance = {
		cache = true,
		rtp = {
			disabled_plugins = {
				"gzip",
				"rplugin",
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
