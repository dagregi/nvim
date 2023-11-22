local M = {}

function M.on_attach(_, bufnr)
	local remap = function(mode, keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
	end
	--lsp things
	remap("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
	remap("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
	remap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

	remap("n", "gd", "<Cmd>Telescope lsp_definitions<Cr>", "Goto Definition")
	remap("n", "gr", "<Cmd>Telescope lsp_references<Cr>", "Goto References")
	remap("n", "gI", "<Cmd>Telescope lsp_implementations<Cr>", "Goto Implementation")

	remap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
	remap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
end

return M
