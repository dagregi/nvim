return {
	"nvim-tree/nvim-web-devicons",
	{
		"j-hui/fidget.nvim",
		event = "BufReadPost",
		opts = {},
	},
	{
		"mbbill/undotree",
		keys = { { "<leader>cu", vim.cmd.UndotreeToggle, desc = "Undotree" } },
	},
	{
		"echasnovski/mini.comment",
		version = false,
		keys = {
			{ "gc", mode = { "n", "v" } },
			{ "gb", mode = { "n", "v" } },
		},
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		config = function()
			require("ibl").setup({})
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
			require("config.utils").on_load("telescope.nvim", function()
				require("telescope").load_extension("projects")
			end)
		end,
	},
}
