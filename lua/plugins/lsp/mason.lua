return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"ray-x/lsp_signature.nvim",
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
	config = function()
		require("plugins.lsp.lsp-config").setup()
		require("plugins.lsp.diagnostics").setup()
		require("plugins.lsp.handlers").setup()
	end,
}
