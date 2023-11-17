return {
	"rose-pine/neovim",
	name = "rose-pine",
	event = "UiEnter",
	opts = {
		variant = "main",
		bold_vert_split = false,
		dim_nc_background = true,
		disable_italics = true,
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
