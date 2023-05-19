return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				--Display mode can be background | virtualtext | foreground
				mode = "virtualtext",
				tailwind = true,
				virtualtext = "██",
			},
		})
	end,
}
