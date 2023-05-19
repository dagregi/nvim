return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = function()
		local cmp, luasnip = require("cmp"), require("luasnip")
		return {
			defaults = {
				experimental = { ghost_text = true },
				window = {
					completion = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
						col_offset = -3,
						side_padding = 0,
					},
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
						keyword_length = 2,
					},
				}),
				formatting = require("plugins.cmp.formatting"),
				mapping = require("plugins.cmp.keybinds").setup(),
			},
			search = {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
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
	dependencies = {
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		require("plugins.cmp.snippet"),
	},
}
