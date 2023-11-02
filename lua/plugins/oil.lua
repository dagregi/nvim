return {
	"stevearc/oil.nvim",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open oil" },
		{ "<C-n>", "<CMD>Oil --float<CR>", desc = "Open oil(float)" },
	},
	opts = {
		float = {
			max_width = 60,
			max_height = 25,
			padding = 5,
		},
		view_options = {
			show_hidden = false,
		},
	},

	config = function(_, opts)
		require("oil").setup(opts)
	end,
}
