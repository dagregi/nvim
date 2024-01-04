return {
	"nvim-lualine/lualine.nvim",
	-- event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 0
	end,
	opts = function()
		local file = {
			"filename",
			path = 1,
			fmt = function(path)
				return table.concat(
					{ vim.fs.basename(vim.fs.dirname(path)), vim.fs.basename(path) },
					package.config:sub(1, 1)
				)
			end,
		}
		return {
			options = {
				theme = "auto",
				globalstatus = true,
				showmode = false,
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = { statusline = { "dashboard", "lazy", "starter" } },
			},
			winbar = {
				lualine_c = { file },
			},
			inactive_winbar = {
				lualine_c = { file },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					{ "diagnostics" },
					{ "filetype", icon_only = true, separator = "", padding = { left = 1 } },
					file,
				},
				lualine_x = {},
				lualine_y = {
					"diff",
					{ "searchcount" },
					{ "progress" },
				},
				lualine_z = {
					{ "selectioncount" },
					{ "location", padding = { left = 0, right = 1 } },
				},
			},
		}
	end,
}
