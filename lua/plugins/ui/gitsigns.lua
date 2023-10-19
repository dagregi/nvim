return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
		current_line_blame_opts = { virt_text_priority = 100 },
		current_line_blame_formatter = " <author>, <author_time> · <summary> ",
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
