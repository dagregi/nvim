return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = { enable_autocmd = false },
			},
		},
		opts = {
			ensure_installed = {
				"html",
				"bash",
				"css",
				"rust",
				"go",
				"javascript",
				"json",
				"markdown",
				"svelte",
				"typescript",
				"yaml",
				"toml",
				"python",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ac"] = { query = "@function.outer", desc = "TS: all class" },
						["ic"] = { query = "@function.inner", desc = "TS: inner class" },
						["af"] = { query = "@function.outer", desc = "TS: all function" },
						["if"] = { query = "@function.inner", desc = "TS: inner function" },
						["aL"] = { query = "@assignment.lhs", desc = "TS: assignment lhs" },
						["aR"] = { query = "@assignment.rhs", desc = "TS: assignment rhs" },
					},
				},
			},
		},
		config = function(_, opts)
			vim.defer_fn(function()
				require("nvim-treesitter.configs").setup(opts)
			end, 0)
		end,
	},
}
