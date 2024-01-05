return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		vim.g.codeium_manual = true
		local remap = require("config.utils").remap
		local codeium = { desc = "Codeium: ", expr = true, silent = true }
		remap("i", "<M-Tab>", function() return vim.fn["codeium#Accept"]() end, "Accept", codeium)
		remap("i", "<C-p>", function() return vim.fn["codeium#CycleCompletions"](-1) end, "Completion prev", codeium)
		remap("i", "<C-n>", function() return vim.fn["codeium#CycleCompletions"](1) end, "Completion next", codeium)
		remap("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, "Clear list", codeium)
		remap("i", "<C-s>", function() return vim.fn["codeium#Complete"]() end, "Manual completion", codeium)
	end,
}
