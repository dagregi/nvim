return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		opts = {
			check_ts = true,
			ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
			fast_wrap = { map = "<M-e>" },
		},
		config = function(_, opts)
			local autopairs = require("nvim-autopairs")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

			autopairs.setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = function()
			local plugin = require("lazy.core.config").spec.plugins["nvim-ts-autotag"]
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			return opts.filetypes or {}
		end,
		opts = {
			filetypes = {
				"tsx",
				"jsx",
				"html",
				"svelte",
				"javascript",
				"typescript",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		event = "BufReadPost",
		keys = {
			{ "ys", desc = "Add surround" },
			{ "ds", desc = "Delete surround" },
			{ "cs", desc = "Replace surround" },
		},
		opts = {
			move_cursor = false,
		},
	},
}
