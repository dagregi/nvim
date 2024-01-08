return {
	"nvim-tree/nvim-web-devicons",
	{
		"j-hui/fidget.nvim",
		event = "LazyFile",
		opts = {},
	},
	{
		"m4xshen/hardtime.nvim",
		event = "LazyFile",
		opts = {},
	},
	{
		"mbbill/undotree",
		keys = { { "<leader>cu", vim.cmd.UndotreeToggle, desc = "Undotree" } },
	},
	{ "echasnovski/mini.comment", version = false, event = "VeryLazy", opts = {} },
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
}
