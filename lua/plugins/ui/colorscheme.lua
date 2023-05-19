return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VimEnter",
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
					notify = true,
					telescope = true,
					gitsigns = true,
					noice = true,
					illuminate = true,
					lsp_trouble = true,
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

						PmenuSel = { bg = colors.crust, bold = true },

						CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
						CmpItemKindKeyword = { fg = C.base, bg = C.red },
						CmpItemKindText = { fg = C.base, bg = C.teal },
						CmpItemKindMethod = { fg = C.base, bg = C.blue },
						CmpItemKindConstructor = { fg = C.base, bg = C.blue },
						CmpItemKindFunction = { fg = C.base, bg = C.blue },
						CmpItemKindFolder = { fg = C.base, bg = C.blue },
						CmpItemKindModule = { fg = C.base, bg = C.blue },
						CmpItemKindConstant = { fg = C.base, bg = C.peach },
						CmpItemKindField = { fg = C.base, bg = C.green },
						CmpItemKindProperty = { fg = C.base, bg = C.green },
						CmpItemKindEnum = { fg = C.base, bg = C.green },
						CmpItemKindUnit = { fg = C.base, bg = C.green },
						CmpItemKindClass = { fg = C.base, bg = C.yellow },
						CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
						CmpItemKindFile = { fg = C.base, bg = C.blue },
						CmpItemKindInterface = { fg = C.base, bg = C.yellow },
						CmpItemKindColor = { fg = C.base, bg = C.red },
						CmpItemKindReference = { fg = C.base, bg = C.red },
						CmpItemKindEnumMember = { fg = C.base, bg = C.red },
						CmpItemKindStruct = { fg = C.base, bg = C.blue },
						CmpItemKindValue = { fg = C.base, bg = C.peach },
						CmpItemKindEvent = { fg = C.base, bg = C.blue },
						CmpItemKindOperator = { fg = C.base, bg = C.blue },
						CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
						CmpItemKindCopilot = { fg = C.base, bg = C.teal },

						-- overrider
						CmpItemMenu = { fg = colors.subtext0 },
						FloatBorder = { fg = colors.surface0 },
						TelescopeBorder = { fg = colors.overlay1 },
						WhichKeyBorder = { fg = colors.overlay1 },
						NeoTreeFloatBorder = { fg = colors.overlay1 },
						LspInfoBorder = { fg = colors.surface0 },

						IndentBlanklineContextChar = { fg = colors.overlay0 },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
