return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"ray-x/lsp_signature.nvim",
			event = "BufReadPost",
			opts = {
				bind = true,
				hint_scheme = "Comment",
				handler_opts = { border = "rounded" },
			},
		},
		{
			"williamboman/mason.nvim",
			cmd = "Mason",
			opts = {
				ui = {
					width = 0.75,
					height = 0.8,
					border = "rounded",
					keymaps = { apply_language_filter = "f" },
				},
			},
		},
	},

	opts = {
		ensure_installed = {
			"tsserver",
			"gopls",
			"pyright",
		},
	},

	config = function(_, opts)
		require("plugins.lsp.diagnostics").setup()
		require("plugins.lsp.handlers").setup()

		require("mason-lspconfig").setup(opts)

		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.tsserver.setup({
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})
		lspconfig.rust_analyzer.setup({
			diagnostics = {
				enable = true,
			},
		})
	end,
}
