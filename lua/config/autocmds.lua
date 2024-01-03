local M = {}
local utils = require("config.utils")
function M.setup()
	-- goto last place
	utils.augroup("LastPlaceLoc", {
		event = "BufReadPost",
		command = function(args)
			local exclude = { "gitcommit" }
			local buf = args.buf
			if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazy_last_loc then
				return
			end
			vim.b[buf].lazy_last_loc = true
			local mark = vim.api.nvim_buf_get_mark(buf, '"')
			local lcount = vim.api.nvim_buf_line_count(buf)
			if mark[1] > 0 and mark[1] <= lcount then
				pcall(vim.api.nvim_win_set_cursor, 0, mark)
			end
		end,
	})
	-- highlight yanks
	utils.augroup("HighlightYank", {
		event = "TextYankPost",
		command = function()
			vim.highlight.on_yank({ timeout = 100 })
		end,
	})
	-- vim-fugitive
	utils.augroup("Fugitive", {
		event = "BufWinEnter",
		pattern = "*",
		command = function()
			if vim.bo.ft ~= "fugitive" then
				return
			end
			local bufnr = vim.api.nvim_get_current_buf()
			local opts = { buffer = bufnr, remap = false, desc = "Fugitive: " }
			utils.remap("n", "<leader>p", "<Cmd>Git push<Cr>", "Push", opts)
			utils.remap("n", "<leader>P", "<Cmd>Git pull --rebase<Cr>", "Pull", opts)
		end,
	})
	utils.augroup("CommitAutoInsert", {
		event = "BufEnter",
		pattern = "COMMIT_EDITMSG",
		command = function()
			vim.wo.spell = true
			vim.api.nvim_win_set_cursor(0, { 1, 0 })
			if vim.fn.getline(1) == "" then
				vim.cmd("startinsert!")
			end
		end,
	})
	utils.augroup("NetrwMappings", {
		event = "FileType",
		pattern = "netrw",
		command = function()
			vim.api.nvim_buf_set_keymap(0, "n", "h", "-^", {})
			vim.api.nvim_buf_set_keymap(0, "n", "l", "<CR>", {})
			vim.api.nvim_buf_set_keymap(0, "n", ".", "gh", {})
			vim.api.nvim_buf_set_keymap(0, "n", "P", "<C-w>z", {})
			vim.api.nvim_buf_set_keymap(0, "n", "<TAB>", "mf", {})
			vim.api.nvim_buf_set_keymap(0, "n", "<S-TAB>", "mF", {})
			vim.api.nvim_buf_set_keymap(0, "n", "<Leader><TAB>", "mu", {})
		end,
	})
end
return M
