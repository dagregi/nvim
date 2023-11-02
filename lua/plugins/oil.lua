return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		view_options = {
			show_hidden = false,
		},
	},

	config = function(_, opts)
		require("oil").setup(opts)
	end,

	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}
