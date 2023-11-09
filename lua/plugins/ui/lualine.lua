return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		-- disable until lualine loads
		vim.opt.laststatus = 0
	end,
	opts = function()
		return {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					},
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = {
							left = 1,
							right = 0,
						},
					},
					{
						"filename",
						path = 1,
						fmt = function(path)
							return table.concat(
								{ vim.fs.basename(vim.fs.dirname(path)), vim.fs.basename(path) },
								package.config:sub(1, 1)
							)
						end,
						symbols = {
							modified = "  ",
							readonly = "",
							unnamed = "",
						},
					},
				},
				lualine_x = {
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					{ "searchcount" },
					{ "selectioncount" },
					function()
						return " " .. os.date("%R")
					end,
				},
			},
		}
	end,
}
