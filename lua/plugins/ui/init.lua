return {
	require("plugins.ui.treesitter"),
	require("plugins.ui.colorscheme"),
	require("plugins.ui.indentline"),
	require("plugins.ui.gitsigns"),
	require("plugins.ui.whichkey"),
	require("plugins.ui.statusline").setup(),
}
