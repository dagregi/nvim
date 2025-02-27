return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local remap = require("config.utils").remap
		remap("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon UI")
		remap("n", "<leader>ha", function() harpoon:list():add() end, "Add file")
		remap("n", "<C-g>", function() harpoon:list():select(1) end)
		remap("n", "<C-t>", function() harpoon:list():select(2) end)
		remap("n", "<C-n>", function() harpoon:list():select(3) end)
		remap("n", "<C-s>", function() harpoon:list():select(4) end)
		remap("n", "<C-\\>", function() harpoon:list():select(5) end)
	end,
}
