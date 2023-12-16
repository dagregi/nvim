return {
	"nvim-tree/nvim-web-devicons",
	{
		"mbbill/undotree",
		keys = { { "<leader>cu", vim.cmd.UndotreeToggle, desc = "Undotree" } },
	},
	{
		"numToStr/Comment.nvim",
		event = "ModeChanged",
		opts = function()
			local ok, tcs = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			return {
				ignore = "^$",
				pre_hook = ok and tcs and tcs.create_pre_hook() or nil,
			}
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				manual_mode = false,
				patterns = { ".git", "pyproject.toml", "go.mod", "Makefile" },
				show_hidden = true,
			})
		end,
	},
	{ "RRethy/vim-illuminate", event = "BufReadPost" },
}
