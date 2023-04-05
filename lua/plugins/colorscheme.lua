return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				term_colors = true,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
				styles = {
					functions = { "italic" },
					keywords = { "bold" },
				},
				integrations = {
					leap = true,
					cmp = true,
					neotree = true,
					mason = true,
					which_key = true,
				},
				custom_highlights = function(colors)
					return {
						-- custom
						PanelHeading = { fg = colors.lavender, style = { "bold", "italic" } },

						-- lazy.nvim
						LazyH1 = {
							bg = true and "NONE" or colors.peach,
							fg = true and colors.lavender or colors.base,
							style = { "bold" },
						},
						LazyButton = {
							bg = "NONE",
							fg = true and colors.overlay0 or colors.subtext0,
						},
						LazyButtonActive = {
							bg = true and "NONE" or colors.overlay1,
							fg = true and colors.lavender or colors.base,
							style = { " bold" },
						},
						LazySpecial = { fg = colors.sapphire },

						-- gitsigns
						GitSignsAddLn = true and { bg = colors.none } or { link = "DiffAdd" },
						GitSignsChangeLn = true and { bg = colors.none } or {
							link = "DiffChange",
						},
						GitSignsAddInline = true and {
							fg = colors.green,
							bg = colors.none,
							style = { "bold" },
						} or { link = "DiffAdd" },
						GitSignsDeleteInline = true and {
							fg = colors.red,
							bg = colors.none,
							style = { "bold" },
						} or { link = "DiffDelete" },
						GitSignsChangeInline = true and {
							fg = colors.yellow,
							bg = colors.none,
							style = { "bold" },
						} or { link = "DiffChange" },

						GitSignsDeleteVirtLn = true and { fg = colors.red, bg = colors.none } or {
							link = "DiffDelete",
						},
						GitSignsDeleteVirtLnInLine = true and {
							fg = colors.red,
							bg = colors.none,
						} or {
							link = "TermCursor",
						},

						-- overrider
						CmpItemMenu = { fg = colors.subtext1 },
						FloatBorder = { fg = colors.overlay1 },
						TelescopeBorder = { fg = colors.overlay1 },
						WhichKeyBorder = { fg = colors.overlay1 },
						NeoTreeFloatBorder = { fg = colors.overlay1 },
						LspInfoBorder = { fg = colors.overlay1 },

						IndentBlanklineContextChar = { fg = colors.overlay0 },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = { "typescript", "typescriptreact", "json", "lua" },
				user_default_options = {
					--Display mode can be background | virtualtext | foreground
					mode = "virtualtext",
					tailwind = true,
					virtualtext = "██",
					always_update = true,
				},
			})
		end,
	},
}
