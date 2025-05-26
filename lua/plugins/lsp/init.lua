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
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = require("plugins.lsp.lsp-keymaps").on_attach(),
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					semanticTokens = true,
				},
			},
		})

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = require("plugins.lsp.lsp-keymaps").on_attach(),
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
				},
			},
		})

		vim.lsp.config("lua_ls", {
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

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"gopls",
			},
		})

		require("plugins.lsp.lsp-keymaps").on_attach()
		require("plugins.lsp.diagnostics").setup()
		require("plugins.lsp.handlers").setup()
	end,
}
