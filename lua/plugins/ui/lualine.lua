return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local colors = require("catppuccin.palettes").get_palette()

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.o.columns > 80
			end,
		}
		local components = {
			mode = {
				"mode",
				icon = " ",
				separator = {
					left = "",
					right = "",
				},
			},
			branch = {
				"branch",
				icon = { " ", color = { fg = colors.pink, gui = "bold" } },
				color = { gui = "bold" },
				separator = {
					right = "",
				},
			},
			filetype = {
				"filetype",
				icon_only = true,
				padding = { right = 0, left = 1 },
				separator = { left = "" },
			},
			filename = {
				"filename",
				file_status = false,
				color = { fg = colors.lavender },
			},
			filesize = {
				"filesize",
				icon = "",
				color = { fg = colors.lavender },
				padding = { left = 0, right = 1 },
				condition = conditions.buffer_not_empty,
			},
			diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = " ",
					warn = " ",
					hint = " ",
					info = " ",
				},
			},
			diff = {
				"diff",
				source = function()
					--@diagnostic disable-next-line: undefined-field
					local gitsigns = vim.b.gitsigns_status_dict
					if gitsigns then
						return {
							added = gitsigns.added,
							modified = gitsigns.changed,
							removed = gitsigns.removed,
						}
					end
				end,
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				cond = conditions.hide_in_width,
			},
			clock = {
				function()
					return " " .. os.date("%R")
				end,
				separator = {
					left = "",
					right = "",
				},
			},
		}
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = "",
				section_separators = "",
				disabled_filetypes = {
					statusline = {
						"qf",
						"lazy",
						"help",
						"diff",
						"alpha",
						"mason",
						"specter",
						"undotree",
						"nvterm",
						"neo-tree",
						"TelescopePrompt",
					},
				},
			},
			sections = {
				lualine_a = { components.mode },
				lualine_b = { components.branch },
				lualine_c = { components.diff, components.diagnostics },
				lualine_x = {
					components.filesize,
				},
				lualine_y = { components.filetype, components.filename },
				lualine_z = { components.clock },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
