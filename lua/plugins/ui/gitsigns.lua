return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		signs = {
			change = { text = "~" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 1500,
		},
		current_line_blame_formatter = "<author>, <author_time> · <summary>",
	},
}
