local M = {}

-- server configs
M._servers = {
	svelte = {},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	},
	tsserver = {
		settings = {
			completions = {
				completeFunctionCalls = true,
			},
		},
	},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
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
	-- TODO: look for a better way to write this code
	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
				on_attach = require("plugins.lsp.lsp-keymaps").on_attach(),
				settings = M._servers[server_name],
				filetypes = (M._servers[server_name] or {}).filetypes,
			})
		end,
	})
	-- TODO: look for a better way to write this code
	for _, server in pairs(vim.tbl_keys(M._servers)) do
		lspconfig[server].setup(M._servers[server])
	end
end

return M
