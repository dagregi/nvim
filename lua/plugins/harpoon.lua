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
		remap("n", "<leader>ha", function()
			mark.add_file()
		end, "Add file")
		remap("n", "<leader>hc", function()
			mark.clear_all()
		end, "Clear marks")
		remap("n", "<C-n>", function()
			ui.nav_next()
		end, "Next mark")
		remap("n", "<C-p>", function()
			ui.nav_prev()
		end, "Prev mark")
	end,
}
