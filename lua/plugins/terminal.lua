return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			persist_size = true,
		},
		config = function(_, opts)
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				direction = "float",
				float_opts = { border = "curved" },
			})
			function _lazygit_toggle()
				lazygit:toggle()
			end
			local rundev = Terminal:new({
				cmd = "yarn dev",
				direction = "horizontal",
			})
			function _rundev_toggle()
				rundev:toggle()
			end
			require("toggleterm").setup(opts)
		end,
		keys = {
			{ "<leader>tA", "<Cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
			{ "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },
			{ "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical terminal" },
			{ "<leader>tT", "<Cmd>ToggleTerm direction=tab<CR>", desc = "Tab terminal" },
			{ "<leader>gg", "<Cmd>lua _lazygit_toggle()<CR>", desc = "Lazygit" },
			{ "<leader>td", "<Cmd>lua _rundev_toggle()<CR>", desc = "Run dev server" },
		},
	},
}
