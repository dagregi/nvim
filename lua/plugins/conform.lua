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
			lua = { "stylua" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			python = { "black" },
			ocaml = { "ocamlformat" },
			javascript = { "prettier" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			go = { "gofumpt" },
			sql = { "sqlfmt" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--tab-width", "4" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
	end,
}
