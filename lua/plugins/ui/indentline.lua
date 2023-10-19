return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = {
				char = "▏",
			},
		})
    end,
}
