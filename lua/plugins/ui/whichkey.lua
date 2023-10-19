return {
	"folke/which-key.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			window = {
				winblend = 15,
				border = "rounded",
			},
			layout = {
				spacing = 5,
				align = "center",
			},
		})
		require("which-key").register({
			["<leader>"] = {
				s = { name = "  " .. " search" },
				t = { name = "  " .. " terminal" },
				g = { name = "  " .. " git" },
				gh = { name = "+ hunks" },
				b = { name = "  " .. " buffers" },
				l = { name = "  " .. " lsp" },
				c = { name = "  " .. " code" },
				f = { name = "  " .. " files/find" },
				x = { name = "  " .. " trouble" },
			},
		})
	end,
}
