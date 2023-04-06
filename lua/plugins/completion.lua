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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
						keyword_length = 2,
					},
					{ name = "path" },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
							symbol_map = {
								Text = "  ",
								Method = "  ",
								Function = "  ",
								Constructor = "  ",
								Field = "  ",
								Variable = "  ",
								Class = "  ",
								Interface = "  ",
								Module = "  ",
								Property = "  ",
								Unit = "  ",
								Value = "  ",
								Enum = "  ",
								Keyword = "  ",
								Snippet = "  ",
								Color = "  ",
								File = "  ",
								Reference = "  ",
								Folder = "  ",
								EnumMember = "  ",
								Constant = "  ",
								Struct = "  ",
								Event = "  ",
								Operator = "  ",
								TypeParameter = "  ",
							},
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"
						return kind
					end,
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s", "c" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s", "c" }),
					["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
					["<C-e>"] = { i = cmp.mapping.abort(), c = cmp.mapping.close() },
					["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-8), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(8), { "i", "c" }),
					-- ["<C-c>"] = cmp.mapping.complete(),
					["<Down>"] = cmp.mapping(
						cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
						{ "i", "c" }
					),
					["<Up>"] = cmp.mapping(
						cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
						{ "i", "c" }
					),
				},
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
		{
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
		},
	},
}
