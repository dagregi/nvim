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
		local lspconfig = require("lspconfig")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				-- "tsserver",
				"gopls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = require("plugins.lsp.lsp-keymaps").on_attach(),
					})
				end,

				["rust_analyzer"] = function()
					lspconfig.rust_analyzer.setup({
						settings = {
							["rust-analyzer"] = {
								check = {
									command = "clippy",
									extraArgs = { "--no-deps" },
								},
							},
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = require("plugins.lsp.lsp-keymaps").on_attach(),
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		require("plugins.lsp.diagnostics").setup()
		require("plugins.lsp.handlers").setup()
	end,
}
