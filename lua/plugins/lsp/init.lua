local M = {
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"b0o/SchemaStore.nvim",
			"jose-elias-alvarez/typescript.nvim",
			{
				"folke/neodev.nvim",
				opts = { experimental = { pathStrict = true } },
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				cond = function()
					return require("config.utils").has("nvim-cmp")
				end,
			},
			{
				"williamboman/mason.nvim",
				cmd = "Mason",
				opts = {
					ui = {
						width = 0.8,
						height = 0.8,
						border = "rounded",
						icons = {
							package_installed = " ",
							package_pending = " ",
							package_uninstalled = " ",
						},
						keymaps = { apply_language_filter = "f" },
					},
				},
			},
		},
		opts = {
			servers = {
				eslint = {
					on_attach = function()
						require("config.utils").augroup("AutoFixOnSave", {
							event = "BufWritePre",
							pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
							command = "EslintFixAll",
							desc = "Automatically execute `eslint fix` on save",
						})
					end,
				},
				tsserver = {
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
						},
					},
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts: table):boolean?>
			setup = {},
		},
		config = function(_, opts)
			require("plugins.lsp.diagnostics").setup()

			require("plugins.lsp.handlers").setup()

			require("config.utils").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keybinds").on_attach(client, buffer)

				require("plugins.lsp.codelens").on_attach(client, buffer)
				require("plugins.lsp.highlight").on_attach(client, buffer)
			end)

			local function setup_server(server)
				local config = require("config.utils").resolve_config(server, opts.servers[server] or {})
				if opts.setup[server] then
					if opts.setup[server](server, config) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, config) then
						return
					end
				end
				require("lspconfig")[server].setup(config)
			end

			local mlsp_available, mlsp = pcall(require, "mason-lspconfig")
			local all_mlsp_servers = {}
			if mlsp_available then
				all_mlsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").package_to_lspconfig)
			end

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(opts.servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
						setup_server(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			if mlsp_available then
				mlsp.setup({ ensure_installed = ensure_installed })
				mlsp.setup_handlers({ setup_server })
			end
		end,
	},
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
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local nls = require("null-ls")

			return {
				sources = {
					-- lua
					nls.builtins.formatting.stylua,

					-- bash
					nls.builtins.formatting.beautysh,
					nls.builtins.diagnostics.shellcheck,

					--typescript
					nls.builtins.formatting.prettierd,
					nls.builtins.diagnostics.eslint_d,

					-- markdown
					nls.builtins.formatting.markdownlint,
					nls.builtins.diagnostics.markdownlint,
				},
				root_dir = require("null-ls.utils").root_pattern("Makefile", ".vim", ".git"),
			}
		end,
	},
}

return M
