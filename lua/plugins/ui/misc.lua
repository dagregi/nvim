return {
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#1E1E2E",
				timeout = 500,
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 100 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		keys = {
			{
				"<leader>cg",
				"<Cmd>Glow<Cr>",
				desc = "Glow",
			},
		},
	},
}
