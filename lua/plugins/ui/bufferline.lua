return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<leader>bp", "<Cmd>BufferLineMovePrev<CR>", desc = "Move prev" },
		{ "<leader>bn", "<Cmd>BufferLineMoveNext<CR>", desc = "Move next" },
		{ "<leader>bL", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close to the left" },
		{ "<leader>bR", "<Cmd>BufferLineCloseRight<CR>", desc = "Close to the right" },
	},
	opts = function()
		return {
			options = {
				buffer_close_icon = " 󰅖 ",
				modified_icon = " ● ",
				close_icon = " 󰅖 ",
				left_trunc_marker = "  ",
				right_trunc_marker = "  ",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "undotree",
						text = "Undotree",
						separator = true,
						text_align = "center",
						highlight = "PanelHeading",
					},
				},
				color_icons = true,
				sort_by = "insert_after_current",
			},
		}
	end,
}
