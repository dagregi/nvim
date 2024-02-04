return {
	{
		"tpope/vim-fugitive",
		keys = { { "<leader>gf", "<Cmd>Git<Cr>", desc = "Fugitive" } },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 1500,
			},
			current_line_blame_formatter = "<author>, <author_time> * <summary>",
		},
		config = function(_, opts)
			local remap = require("config.utils").remap
			remap("n", "<leader>gsd", "<Cmd>Gitsigns toggle_deleted<Cr>", "Toggle: deleted")
			remap("n", "<leader>gss", "<Cmd>Gitsigns stage_hunk<Cr>", "Stage hunk")
			remap("n", "<leader>gsS", "<Cmd>Gitsigns stage_buffer<Cr>", "Buffer: Stage buffer")
			remap("n", "<leader>gsu", "<Cmd>Gitsigns undo_stage_hunk<Cr>", "Unstage hunk")
			remap("n", "<leader>gsr", "<Cmd>Gitsigns reset_hunk<Cr>", "Reset hunk")
			remap("n", "<leader>gsR", "<Cmd>Gitsigns reset_buffer<Cr>", "Buffer: Reset buffer")
			remap("n", "<leader>gsv", "<Cmd>Gitsigns select_hunk<Cr>", "Select hunk")
			remap("n", "]h", "<Cmd>Gitsigns next_hunk<Cr>", "Next hunk")
			remap("n", "[h", "<Cmd>Gitsigns prev_hunk<Cr>", "Previous hunk")
			require("gitsigns").setup(opts)
		end,
	},
}
