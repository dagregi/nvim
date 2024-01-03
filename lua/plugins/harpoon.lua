return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<C-g>",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Harpoon UI",
		},
	},
	config = function()
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")
		local remap = require("config.utils").remap
		remap("n", "<leader>ha", function() mark.add_file() end, "Add file")
		remap("n", "<leader>hc", function() mark.clear_all() end, "Clear marks")
		remap("n", "<C-i>", function() ui.nav_file(1) end)
		remap("n", "<C-t>", function() ui.nav_file(2) end)
		remap("n", "<C-n>", function() ui.nav_file(3) end)
		remap("n", "<C-s>", function() ui.nav_file(4) end)
	end,
}
