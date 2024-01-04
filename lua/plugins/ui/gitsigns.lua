return {
	"lewis6991/gitsigns.nvim",
	event = "LazyFile",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 1500,
		},
		current_line_blame_formatter = "<author>, <author_time> * <summary>",
	},
	config = function(_, opts)
		local remap = require("config.utils").remap
		local hunk_opts = { desc = "Hunk: " }
		remap("n", "<leader>gsl", "<Cmd>Gitsigns toggle_linehl<Cr>", "Toggle: line highlight")
		remap("n", "<leader>gsn", "<Cmd>Gitsigns toggle_numhl<Cr>", "Toggle: number highlight")
		remap("n", "<leader>gsd", "<Cmd>Gitsigns toggle_deleted<Cr>", "Toggle: deleted")
		remap("n", "<leader>gss", "<Cmd>Gitsigns stage_hunk<Cr>", "Stage hunk", hunk_opts)
		remap("n", "<leader>gsS", "<Cmd>Gitsigns stage_buffer<Cr>", "Buffer: Stage buffer")
		remap("n", "<leader>gsu", "<Cmd>Gitsigns undo_stage_hunk<Cr>", "Unstage hunk", hunk_opts)
		remap("n", "<leader>gsr", "<Cmd>Gitsigns reset_hunk<Cr>", "Reset hunk", hunk_opts)
		remap("n", "<leader>gsR", "<Cmd>Gitsigns reset_buffer<Cr>", "Buffer: Reset buffer")
		remap("n", "<leader>gsv", "<Cmd>Gitsigns select_hunk<Cr>", "Select hunk", hunk_opts)
		remap("n", "]h", "<Cmd>Gitsigns next_hunk<Cr>", "Next hunk", hunk_opts)
		remap("n", "[h", "<Cmd>Gitsigns prev_hunk<Cr>", "Previous hunk", hunk_opts)
		require("gitsigns").setup(opts)
	end,
}
