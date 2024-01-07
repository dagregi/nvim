return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			{ "folke/neodev.nvim", opts = {} },
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp, luasnip = require("cmp"), require("luasnip")
			return {
				defaults = {
					window = {
						documentation = cmp.config.window.bordered(),
					},
					completion = {
						side_padding = 1,
						completeopt = "menu,menuone,noinsert",
					},
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					sources = cmp.config.sources({
						{ name = "luasnip" },
						{ name = "nvim_lsp" },
						{ name = "codeium" },
						{ name = "path" },
						{ name = "buffer" },
					}),
					formatting = require("plugins.cmp.formatting"),
					experimental = {
						ghost_text = {
							hl_group = "CmpGhostText",
						},
					},
					mapping = require("plugins.cmp.keybinds").setup(),
				},
				search = {
					mapping = cmp.mapping.preset.cmdline(),
					sources = { { name = "buffer" } },
				},
				command = {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				},
			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup(opts.defaults)
			cmp.setup.cmdline({ "/", "?" }, opts.search)
			cmp.setup.cmdline(":", opts.command)
		end,
	},
	require("plugins.cmp.lua-snip"),
}
