return {
	"folke/which-key.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			window = {
				winblend = 35,
			},
			layout = {
				spacing = 7,
				align = "center",
			},
		})
		require("which-key").register({
			["<leader>"] = {
				b = { name = "  " .. "buffers" },
				c = { name = "  " .. "code" },
				f = { name = "  " .. "files/find" },
				g = { name = "  " .. "git" },
				gh = { name = " hunks" },
				gb = { name = " buffer" },
				gt = { name = " toggles" },
				h = { name = "  " .. "harpoon" },
				s = { name = "  " .. "search" },
			},
		})
	end,
}
