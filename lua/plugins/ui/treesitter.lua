return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
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
				"python",
			},
			auto_install = true,
			highlight = { enable = true },
			textobjects = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
		},
		config = function(_, opts)
			--require("nvim-treesitter.install").prefer_git=true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
