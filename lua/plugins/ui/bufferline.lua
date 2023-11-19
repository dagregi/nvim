return {
	"akinsho/bufferline.nvim",
	event = "BufAdd",
	keys = {
		{ "[b", "<Cmd>BufferLineMovePrev<CR>", desc = "Move prev" },
		{ "]b", "<Cmd>BufferLineMoveNext<CR>", desc = "Move next" },
		{ "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<leader>bL", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close to the left" },
		{ "<leader>bR", "<Cmd>BufferLineCloseRight<CR>", desc = "Close to the right" },
	},
	opts = {
		options = {
			numbers = "ordinal",
			buffer_close_icon = "",
			modified_icon = " ●",
			close_icon = "",
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
		},
	},
}
