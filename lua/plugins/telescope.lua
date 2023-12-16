return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.4",
	cmd = "Telescope",
	keys = {
		-- files
		{ "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Find in files (Grep)" },
		{ "<leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Find word" },
		{ "<leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent files" },
		{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Recent projects" },
		{ "<leader>fc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy search" },
		{ "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "List buffers" },
		{ "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "List diagnostics" },
		{ "<leader>fR", "<Cmd>Telescope resume<CR>", desc = "Resume" },
		-- git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
		-- search
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	},
	opts = function()
		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				file_ignore_patterns = {
					"%.jpg",
					"%.jpeg",
					"%.png",
					"%.otf",
					"%.ttf",
					"^.git/",
					"^dist/",
					"^node_modules/",
					"^site-packages/",
					"^__pycache__/",
					"^migrations/",
					".mypy_cache/",
					"package-lock.json",
					"yarn.lock",
					"Cargo.lock",
					"pnpm-lock.yaml",
				},
				path_display = {
					truncate = 3,
				},
				mappings = {
					i = {
						["<Esc>"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					sort_mru = true,
					sort_lastused = true,
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("projects")
	end,
	dependencies = {
		"BurntSushi/ripgrep",
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}
