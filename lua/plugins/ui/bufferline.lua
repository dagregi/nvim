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
		return {
			options = {
				indicator = { icon = "▎", style = "icon" },
				buffer_close_icon = " 󰅖 ",
				modified_icon = " ● ",
				close_icon = " 󰅖 ",
				left_trunc_marker = "  ",
				right_trunc_marker = "  ",
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
		}
	end,
}
