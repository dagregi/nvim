return {
	"rose-pine/neovim",
	name = "rose-pine",
	event = "LazyFile",
	opts = {
		variant = "main",
		bold_vert_split = false,
		disable_background = true,
		disable_float_background = true,
		dim_nc_background = true,
		disable_italics = true,
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
