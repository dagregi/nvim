return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		local remap = require("config.utils").remap
		remap("n", "<leader>ha", function() harpoon:list():append() end, "Add file")
		remap("n", "<C-h>", function() harpoon:list():select(1) end)
		remap("n", "<C-t>", function() harpoon:list():select(2) end)
		remap("n", "<C-n>", function() harpoon:list():select(3) end)
		remap("n", "<C-s>", function() harpoon:list():select(4) end)
	end,
}
