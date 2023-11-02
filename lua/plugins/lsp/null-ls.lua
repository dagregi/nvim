return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local nls = require("null-ls")
		local formatting = nls.builtins.formatting
		local diagnostics = nls.builtins.diagnostics

		return {
			sources = {
				-- lua
				formatting.stylua,

				--bash
				formatting.shfmt,
				-- diagnostics.shellcheck,

				--typescript
				formatting.prettierd,
				diagnostics.eslint_d,

				--python
				-- formatting.black,
				-- diagnostics.pylint,

				--gdscript
				formatting.gdformat,
				diagnostics.gdlint,

				--go
				-- formatting.gofmt,

				--rust
				formatting.rustfmt,

				--markdownl
				formatting.markdownlint,
				diagnostics.markdownlint,
			},
			root_dir = require("null-ls.utils").root_pattern("Makefile", ".vim", ".git"),
		}
	end,
}
