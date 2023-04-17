return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_first_indent_level = false,
				filetype_exclude = { "help", "alpha", "neo-tree", "lazy", "mason" },
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
		opts = function()
			local function get_hight(self, _, max_lines)
				local results = #self.finder.results
				local PADDING = 4
				local LIMIT = math.floor(max_lines / 2)
				return (results <= (LIMIT - PADDING) and results + PADDING or LIMIT)
			end

			return {
				input = {
					win_options = { winblend = 0 },
				},
				select = {
					telescope = require("telescope.themes").get_dropdown({
						layout_config = { height = get_hight },
					}),
					get_config = function(opts)
						if opts.kind == "codeaction" then
							return {
								backend = "telescope",
								telescope = require("telescope.themes").get_cursor({
									layout_config = { height = get_hight },
								}),
							}
						end
					end,
				},
			}
		end,
	},
	{
		"folke/noice.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "rcarriga/nvim-notify" },
		config = function()
			require("noice").setup({
				lsp = {
					signature = { enabled = false },
					hover = { enabled = false },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v2.x",
		dependencies = { "MunifTanjim/nui.nvim" },
		keys = {
			{
				"<C-n>",
				function()
					require("neo-tree.command").execute({ toggle = true, reveal = true })
				end,
				desc = "Explorer (NeoTree)",
			},
		},
		config = function()
			require("neo-tree").setup({
				sources = { "filesystem", "buffers", "git_status" },
				source_selector = {
					winbar = true,
					separator = "",
					content_layout = "center",
					tab_labels = {
						filesystem = " Files",
						buffers = " Buffers",
						git_status = " Git",
					},
				},
				enable_git_status = true,
				enable_diagnostics = true,
				close_if_last_window = true,
				popup_border_style = "rounded",
				event_handlers = {
					{
						event = "file_opened",
						handler = function()
							require("neo-tree").close_all()
						end,
					},
				},
				window = {
					width = 33,
				},
				default_component_configs = {
					indent = {
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						with_expanders = true,
						expander_collapsed = " ",
						expander_expanded = " ",
					},
					name = { trailing_slash = false, use_git_status_colors = true },
					git_status = {
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
							unstaged = " ",
						},
					},
				},
				follow_current_file = true,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local colors = require("catppuccin.palettes").get_palette()

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.o.columns > 80
				end,
			}
			local components = {
				mode = {
					"mode",
					icon = " ",
					separator = {
						left = "",
						right = "",
					},
				},
				branch = {
					"branch",
					icon = { " ", color = { fg = colors.pink, gui = "bold" } },
					color = { gui = "bold" },
					separator = {
						right = "",
					},
				},
				filetype = {
					"filetype",
					icon_only = true,
					padding = { right = 0, left = 1 },
					separator = { left = "" },
				},
				filename = {
					"filename",
					file_status = false,
					color = { fg = colors.lavender },
				},
				filesize = {
					"filesize",
					icon = "",
					color = { fg = colors.lavender },
					padding = { left = 0, right = 1 },
					condition = conditions.buffer_not_empty,
				},
				diagnostics = {
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					symbols = {
						error = " ",
						warn = " ",
						hint = " ",
						info = " ",
					},
				},
				diff = {
					"diff",
					source = function()
						--@diagnostic disable-next-line: undefined-field
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					cond = conditions.hide_in_width,
				},
				clock = {
					function()
						return " " .. os.date("%R")
					end,
					separator = {
						left = "",
						right = "",
					},
				},
			}
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					component_separators = "",
					section_separators = "",
					disabled_filetypes = {
						statusline = {
							"qf",
							"lazy",
							"help",
							"diff",
							"alpha",
							"mason",
							"specter",
							"undotree",
							"nvterm",
							"neo-tree",
							"TelescopePrompt",
						},
					},
				},
				sections = {
					lualine_a = { components.mode },
					lualine_b = { components.branch },
					lualine_c = { components.diff, components.diagnostics },
					lualine_x = {
						components.filesize,
					},
					lualine_y = { components.filetype, components.filename },
					lualine_z = { components.clock },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPost", "BufNewFile" },
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		config = function()
			require("barbecue").setup({
				theme = "catppuccin",
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")

			local function button(hl, ...)
				local btn = dashboard.button(...)
				local details = select(2, ...)
				local icon = details:match("[^%w%s]+")
				btn.opts.hl = { { hl, 0, #icon + 1 } }
				btn.opts.hl_shortcut = "Title"
				return btn
			end

			dashboard.section.header.val = "Heh"
			dashboard.section.buttons.val = {
				button("Character", "n", "  New file", "<Cmd>ene<Bar>star<CR>"),
				button("Label", "g", "  Find text", "<Cmd>Telescope live_grep_args<CR>"),
				button("Special", "f", "  Find file", "<Cmd>Telescope find_files<CR>"),
				button("Macro", "r", "  Recent files", "<Cmd>Telescope oldfiles<CR>"),
				button("Winbar", "p", "  Recent project", "<Cmd>Telescope projects<CR>"),
				button("Error", "q", "  Quit NVIM", "<Cmd>quitall<CR>"),
			}

			dashboard.section.header.opts.hl = "Function"
			dashboard.section.footer.opts.hl = "Conceal"

			dashboard.config.layout = {
				{ type = "padding", val = 5 },
				dashboard.section.header,
				{ type = "padding", val = 1 },
				dashboard.section.buttons,
				{ type = "padding", val = 1 },
				dashboard.section.footer,
			}

			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.config)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					local v = vim.version() or {}
					local version = string.format(
						"%s Neovim v%d.%d.%d%s",
						" ",
						v.major,
						v.minor,
						v.patch,
						v.prerelease and "(nightly)" or ""
					)

					dashboard.section.footer.val =
						string.format("--- %s loaded %d %s plugins in %d ms ---", version, stats.count, "", ms)
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
			{ "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Buffer pick" },
			{ "<leader>bP", "<Cmd>BufferLinePickClose<CR>", desc = "Pick close" },
			{ "<leader>b[", "<Cmd>BufferLineMovePrev<CR>", desc = "Move prev" },
			{ "<leader>b]", "<Cmd>BufferLineMoveNext<CR>", desc = "Move next" },
			{ "<leader>bL", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close to the left" },
			{ "<leader>bR", "<Cmd>BufferLineCloseRight<CR>", desc = "Close to the right" },
		},
		opts = function()
			local colors = require("catppuccin.palettes").get_palette()
			local ctp = require("catppuccin.groups.integrations.bufferline")

			return {
				options = {
					indicator = { icon = "▎", style = "icon" },
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
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
				highlights = ctp.get({
					custom = {
						all = {
							buffer_selected = { fg = colors.lavender },
							error = { fg = colors.surface1 },
							error_diagnostic = { fg = colors.surface1 },
							warning = { fg = colors.surface1 },
							warning_diagnostic = { fg = colors.surface1 },
							info = { fg = colors.surface1 },
							info_diagnostic = { fg = colors.surface1 },
							hint = { fg = colors.surface1 },
							hint_diagnostic = { fg = colors.surface1 },
						},
					},
				}),
			}
		end,
	},
}
