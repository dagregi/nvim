return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<leader>b[", "<Cmd>BufferLineMovePrev<CR>", desc = "Move prev" },
		{ "<leader>b]", "<Cmd>BufferLineMoveNext<CR>", desc = "Move next" },
		{ "<leader>bL", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close to the left" },
		{ "<leader>bR", "<Cmd>BufferLineCloseRight<CR>", desc = "Close to the right" },
	},
	opts = function()
		local colors = require("catppuccin.palettes").get_palette()
		local ctp = require("catppuccin.groups.integrations.bufferline")

		return {
			options = {
				indicator = { icon = "▎", style = "icon" },
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorer",
						separator = true,
						text_align = "center",
						highlight = "PanelHeading",
					},
					{
						filetype = "undotree",
						text = "Undotree",
						separator = true,
						text_align = "center",
						highlight = "PanelHeading",
					},
					{
						filetype = "dapui_scopes",
						text = "Debugger",
						separator = true,
						text_align = "center",
						highlight = "PanelHeading",
					},
				},
				show_close_icon = true,
				show_buffer_close_icons = true,
				sort_by = "insert_after_current",
			},
			highlights = ctp.get({
				custom = {
					all = {
						buffer_selected = { fg = colors.lavender },
						error = { fg = colors.red },
						error_diagnostic = { fg = colors.red },
						warning = { fg = colors.yellow },
						warning_diagnostic = { fg = colors.yellow },
						info = { fg = colors.sky },
						info_diagnostic = { fg = colors.sky },
						hint = { fg = colors.surface1 },
						hint_diagnostic = { fg = colors.surface1 },
					},
				},
			}),
		}
	end,
}
