return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "LazyFile",
		main = "ibl",
		config = function()
			require("ibl").setup({})
		end,
	},
}
