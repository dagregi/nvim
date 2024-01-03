return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "LazyFile",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏",
				},
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "LazyFile",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
	},
}
