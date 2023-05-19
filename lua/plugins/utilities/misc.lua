return {
	{
		"nvim-pack/nvim-spectre",
	},
	{
		"ethanholz/nvim-lastplace",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-lastplace").setup({})
		end,
	},
	{
		"folke/persistence.nvim",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
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
}
