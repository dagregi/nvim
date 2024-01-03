return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			-- python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "rustywind", "prettier" },
			go = { "gofumpt" },
			ocaml = { "ocamlformat" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", "4" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
