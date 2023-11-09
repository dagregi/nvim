return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
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
