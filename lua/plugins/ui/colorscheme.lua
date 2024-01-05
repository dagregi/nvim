return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		branch = "canary",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			variant = "main",
			bold_ver_split = true,
			dim_inactive_windows = true,
			extend_background_behind_borders = true,
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
			highlight_groups = {
				netrwDir = { fg = "foam" },
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "none" },
				TelescopeSelectionCaret = { fg = "rose", bg = "none" },
				String = { fg = "#a6e3a1" },
				Visual = { fg = "inherit", bg = "highlight_high" },
				["@field"] = { fg = "#b4befe" },
				["@property"] = { fg = "#b4befe" },
				ModesNormal = { fg = "base", bg = "rose", bold = true },
				ModesCommand = { fg = "base", bg = "love", bold = true },
				ModesVisual = { fg = "base", bg = "iris", bold = true },
				ModesReplace = { fg = "base", bg = "#cba6f7", bold = true },
				ModesInsert = { fg = "base", bg = "foam", bold = true },
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
