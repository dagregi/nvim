local M = {}

function M.on_attach(_, bufnr)
	local remap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	--lsp things
	remap("<leader>cf", vim.lsp.buf.format, "Format document")
	remap("<leader>cr", vim.lsp.buf.rename, "Rename")
	remap("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
	remap("<leader>ca", vim.lsp.buf.code_action, "Code action")

	remap("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
	remap("gr", require("telescope.builtin").lsp_references, "Goto References")
	remap("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")

	remap("K", vim.lsp.buf.hover, "Hover Documentation")
	remap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
end

return M
