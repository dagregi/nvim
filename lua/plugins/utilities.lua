return {
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
	},
  {
    "folke/persistence.nvim",
    event={"BufReadPre", "VeryLazy"},
    opts={options={"buffers","curdir","tabpages","winsize","help","globals"}},
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"lewis6991/impatient.nvim",
    lazy = false,
		config = function()
			require("impatient")
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#1E1E2E",
				timeout = 500,
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				window = {
					winblend = 30,
					border = "rounded",
				},
				layout = {
					spacing = 5,
					align = "center",
				},
			})
			require("which-key").register({
				["<leader>"] = {
					s = { name = "+ search" },
					t = { name = "+ terminal" },
					g = { name = "+ git" },
					gh = { name = "+ hunks" },
					b = { name = "+ buffers" },
					c = { name = "+ code" },
					f = { name = "+ files/find" },
					x = { name = "+ trouble" },
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
		},
	},
	{
		"ahmedkhalf/project.nvim",
    event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				manual_mode = false,
				patterns = { ".git", "pyproject.toml", "go.mod", "Makefile" },
				show_hidden = true,
			})
		end,
	},
}
