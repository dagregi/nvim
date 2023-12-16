local M = {}
function M.on_attach(_, bufnr)
	local opts = { buffer = bufnr, desc = "LSP: " }
	local remap = require("config.utils").remap
	--lsp things
	remap("n", "<leader>cr", vim.lsp.buf.rename, "Rename", opts)
	remap("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics", opts)
	remap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action", opts)
	remap("n", "gd", "<Cmd>Telescope lsp_definitions<Cr>", "Goto Definition", opts)
	remap("n", "gr", "<Cmd>Telescope lsp_references<Cr>", "Goto References", opts)
	remap("n", "gI", "<Cmd>Telescope lsp_implementations<Cr>", "Goto Implementation", opts)
	remap("n", "K", vim.lsp.buf.hover, "Hover Documentation", opts)
	remap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation", opts)
end
return M
