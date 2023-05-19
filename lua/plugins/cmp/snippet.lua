return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	keys = {
		{
			"<C-o>",
			function()
				if require("luasnip").choice_active() then
					require("luasnip").change_choice(1)
				end
			end,
			mode = { "s", "i" },
			desc = "Select within a list of options",
		},
	},
	opts = function()
		local types = require("luasnip.util.types")

		return {
			region_check_events = "CursorMoved,CursorHold,InsertEnter",
			delete_check_events = "InsertLeave",
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = {
							{ "Type" },
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		require("luasnip").setup(opts)
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
