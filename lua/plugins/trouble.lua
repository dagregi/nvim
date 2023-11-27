return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>xq",
			"<Cmd>TroubleToggle quickfix<Cr>",
			desc = "Trouble: Quickfix",
		},
		{
			"<leader>xd",
			"<Cmd>TroubleToggle document_diagnostics<Cr>",
			desc = "Trouble: Document diagnostics",
		},
		{
			"<leader>xD",
			"<Cmd>TroubleToggle workspace_diagnostics<Cr>",
			desc = "Trouble: Workspace diagnostics",
		},
	},
}
