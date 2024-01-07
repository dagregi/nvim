return {
	"Exafunction/codeium.nvim",
	event = "VeryLazy",
	config = function()
		require("codeium").setup({})
	end,
}
