return {
	{
		"kylechui/nvim-surround",
		keys = {
			{ "ys", desc = "Add surround", mode = { "n" } },
			{ "ds", desc = "Delete surround", mode = { "n" } },
			{ "cs", desc = "Replace surround", mode = { "n" } },
			{ "S", desc = "Add surround", mode = { "v" } },
		},
		opts = {
			move_cursor = false,
		},
	},
}
