return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
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
			keys = { { "<leader>cm", "<Cmd>Mason<Cr>", desc = "Mason" } },
			opts = {},
		},
	},
	config = function()
		require("plugins.lsp.lsp-config").setup()
		require("plugins.lsp.diagnostics").setup()
		require("plugins.lsp.handlers").setup()
	end,
}
