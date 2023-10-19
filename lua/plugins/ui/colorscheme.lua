return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- event = "VimEnter",
	-- priority = 1000,
	-- opts = {
	-- 	dim_inactive = {
	-- 		enabled = true,
	-- 		shade = "dark",
	-- 		percentage = 0.15,
	-- 	},
	-- 	styles = {
	-- 		functions = { "italic" },
	-- 		keywords = { "bold" },
	-- 	},
	-- 	integrations = {
	-- 		leap = true,
	-- 		cmp = true,
	-- 		neotree = true,
	-- 		mason = true,
	-- 		notify = true,
	-- 		telescope = true,
	-- 		gitsigns = true,
	-- 		noice = true,
	-- 		illuminate = true,
	-- 		lsp_trouble = true,
	-- 		which_key = true,
	-- 	},
	-- },
	"rose-pine/neovim",
	name = "rose-pine",
	event = "VimEnter",
	opts = {
		variant = "main",
		bold_vert_split = true,
		dim_nc_background = true,
		disable_italics = true,
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
