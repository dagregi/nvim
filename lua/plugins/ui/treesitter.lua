return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "LazyFile", "VeryLazy" },
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = {
			ensure_installed = {
				"html",
				"bash",
				"css",
				"rust",
				"haskell",
				"ocaml",
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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<M-w>",
					node_incremental = "<M-w>",
					node_decremental = "<M-C-w>",
					scope_incremental = "<M-e>",
				},
			},
			context_commentstring = { enable = true, enable_autocmd = false },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ac"] = { query = "@conditional.outer", desc = "TS: around conditional" },
						["ic"] = { query = "@conditional.inner", desc = "TS: inner conditional" },
						["aa"] = { query = "@parameter.outer", desc = "TS: around parameter" },
						["ia"] = { query = "@parameter.inner", desc = "TS: inner parameter" },
						["av"] = { query = "@variable.outer", desc = "TS: around variable" },
						["iv"] = { query = "@variable.inner", desc = "TS: inner variable" },
						["af"] = { query = "@function.outer", desc = "TS: around function" },
						["if"] = { query = "@function.inner", desc = "TS: inner function" },
						["aL"] = { query = "@assignment.lhs", desc = "TS: assignment lhs" },
						["aR"] = { query = "@assignment.rhs", desc = "TS: assignment rhs" },
					},
				},
				swap = {
					enable = true,
					swap_next = swap_next,
					swap_previous = swap_prev,
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
