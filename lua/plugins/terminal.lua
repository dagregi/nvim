return {
	{
		"NvChad/nvterm",
		lazy = false,
		config = function()
			require("nvterm").setup({
				terminals = {
					type_opts = {
						horizontal = { location = "rightbelow", split_ratio = 0.2 },
						vertical = { location = "rightbelow", split_ratio = 0.4 },
					},
				},
				behavior = {
					autoclose_on_quit = {
						enabled = true,
						confirm = false,
					},
					close_on_exit = true,
					auto_insert = false,
				},
			})
		end,
		keys = {
			{
				"<leader>th",
				function()
					require("nvterm.terminal").new("horizontal")
				end,
				desc = "Horzontal terminal",
			},
			{
				"<leader>tv",
				function()
					require("nvterm.terminal").toggle("vertical")
				end,
				desc = "Vertical terminal",
			},
			{
				"<leader>tf",
				function()
					require("nvterm.terminal").toggle("float")
				end,
				desc = "Floating terminal",
			},
			{
				"<leader>td",
				function()
					require("nvterm.terminal").send("npmR dev", "float")
				end,
				desc = "Run dev server",
			},
		},
	},
}
