return {
	require("plugins.ui.treesitter"),
	require("plugins.ui.colorscheme"),
	require("plugins.ui.winbar").setup(),
	require("plugins.ui.statusline").setup(),
}
