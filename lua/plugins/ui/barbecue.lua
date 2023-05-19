return {
	"utilyre/barbecue.nvim",
	event = { "BufReadPost", "BufNewFile" },
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	config = function()
		require("barbecue").setup({
			theme = "catppuccin",
		})
	end,
}
