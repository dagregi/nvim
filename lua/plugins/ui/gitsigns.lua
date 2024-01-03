return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
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
		-- toggles
		remap("n", "<leader>gtl", "<Cmd>Gitsigns toggle_linehl<Cr>", "Toggle: line highlight")
		remap("n", "<leader>gtn", "<Cmd>Gitsigns toggle_numhl<Cr>", "Toggle: number highlight")
		remap("n", "<leader>gtd", "<Cmd>Gitsigns toggle_deleted<Cr>", "Toggle: deleted")
		-- Hunks
		-- stage/unstage
		remap("n", "<leader>ghs", "<Cmd>Gitsigns stage_hunk<Cr>", "Stage hunk", hunk_opts)
		remap("n", "<leader>ghu", "<Cmd>Gitsigns undo_stage_hunk<Cr>", "Unstage hunk", hunk_opts)
		remap("n", "<leader>ghr", "<Cmd>Gitsigns reset_hunk<Cr>", "Reset hunk", hunk_opts)
		-- select
		remap("n", "<leader>ghv", "<Cmd>Gitsigns select_hunk<Cr>", "Select hunk", hunk_opts)
		remap("n", "]h", "<Cmd>Gitsigns next_hunk<Cr>", "Next hunk", hunk_opts)
		remap("n", "[h", "<Cmd>Gitsigns prev_hunk<Cr>", "Previous hunk", hunk_opts)
		-- Buffer
		remap("n", "<leader>gbs", "<Cmd>Gitsigns stage_buffer<Cr>", "Buffer: Stage buffer")
		remap("n", "<leader>gbr", "<Cmd>Gitsigns reset_buffer<Cr>", "Buffer: Reset buffer")
		require("gitsigns").setup(opts)
	end,
}
