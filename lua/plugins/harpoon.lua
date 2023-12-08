return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<C-g>",
			-- function()
			-- 	require("harpoon.ui").toggle_quick_menu()
			-- end,
			"<Cmd>Telescope harpoon marks<Cr>",
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

		remap("n", "<C-1>", function()
			ui.nav_file(1)
		end)
		remap("n", "<C-2>", function()
			ui.nav_file(2)
		end)
		remap("n", "<C-3>", function()
			ui.nav_file(3)
		end)
		remap("n", "<C-4>", function()
			ui.nav_file(4)
		end)
	end,
}
