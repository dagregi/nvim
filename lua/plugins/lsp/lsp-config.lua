local M = {}

M._servers = {
	-- ocamllsp = {},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
				codelenses = {
					gc_details = true,
					generate = true,
					regenerate_cgo = true,
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
				analyses = {
					fieldalignment = true,
					nilness = true,
					unusedparams = true,
					unusedwrite = true,
					useany = true,
				},
				completeUnimported = true,
				staticcheck = true,
				directoryFilters = { "-.git", "-node_modules" },
				semanticTokens = true,
			},
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
				procMacro = {
					enable = true,
					ignored = {
						["async-trait"] = { "async_trait" },
						["napi-derive"] = { "napi" },
						["async-recursion"] = { "async_recursion" },
					},
				},
			},
		},
	},
	tsserver = { settings = { completions = { completeFunctionCalls = true } } },
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
}
function M.setup()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")
	mason_lspconfig.setup({
		-- ensure_installed = vim.tbl_keys(M._servers),
	})
	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
				on_attach = require("plugins.lsp.lsp-keymaps").on_attach(),
			})
		end,
	})
	for _, server in pairs(vim.tbl_keys(M._servers)) do
		lspconfig[server].setup(M._servers[server])
	end
end
return M
