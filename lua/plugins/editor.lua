return {
	{
		"windwp/nvim-autopairs",
		lazy = true,
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
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = function()
			local ok, tcs = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			return {
				ignore = "^$",
				pre_hook = ok and tcs and tcs.create_pre_hook() or nil,
			}
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				current_line_blame = true,
				current_line_blame_opts = { virt_text_priority = 100 },
				current_line_blame_formatter = " <author>, <author_time> · <summary> ",
				preview_config = { border = "rounded" },
				on_attach = function(buffer)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
					end
					map("n", "]h", gs.next_hunk, "Next Hunk")
					map("n", "[h", gs.prev_hunk, "Prev Hunk")
					map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
					map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
					map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
					map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
					map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
					map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
					map("n", "<leader>ghb", function()
						gs.blame_line({ full = true })
					end, "Blame Line")
					map("n", "<leader>ghd", gs.diffthis, "Diff This")
					map("n", "<leader>ghD", function()
						gs.diffthis("~")
					end, "Diff This ~")
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
				end,
			})
		end,
	},
}
