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
require("lazy").setup({
	spec = "plugins",
	defaults = { lazy = false },
	change_detection = { notify = false },
	performance = {
		cache = true,
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"rplugin",
				"matchit",
				"matchparen",
				"logipat",
				"netrw",
				-- "netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
