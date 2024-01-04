local M = {}

local api = vim.api
local fn = vim.fn
local Util = require("config.utils")

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function get_mode()
	local current_mode = api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

local function filetype()
	local icon, hl_group = require("nvim-web-devicons").get_icon(vim.bo.ft)
	local parts = {
		string.format("%%#%s#", hl_group),
		icon,
		" %#Normal#",
	}
	return table.concat(parts)
end

local function filename()
	local fname = fn.expand("%:~:.")
	local parts = {
		string.format(" %s %%m", fname),
	}
	return table.concat(parts)
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local parts = {}
	if count["errors"] ~= 0 then
		table.insert(parts, " %#DiagnosticError#󰅚 " .. count["errors"])
	end
	if count["warnings"] ~= 0 then
		table.insert(parts, " %#DiagnosticWarn# " .. count["warnings"])
	end
	if count["hints"] ~= 0 then
		table.insert(parts, " %#DiagnosticHint#󰌶 " .. count["hints"])
	end
	if count["info"] ~= 0 then
		table.insert(parts, " %#DiagnosticInfo# " .. count["info"])
	end

	table.insert(parts, "%#Normal#")

	return table.concat(parts)
end

local function vcs()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
	local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
	local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
	if git_info.added == 0 then
		added = ""
	end
	if git_info.changed == 0 then
		changed = ""
	end
	if git_info.removed == 0 then
		removed = ""
	end
	local parts = { "%#GitSignsAdd#  ", git_info.head, " %#Normal#", "| ", added, changed, removed }
	return table.concat(parts)
end

local function lineinfo()
	return " %p%% %l:%c "
end

M.statusline = function()
	local mode = get_mode()
	local vcs_info = vcs()
	local file_type = filetype()
	local file_name = filename()
	local lsp_info = lsp()
	local line_info = lineinfo()
	local parts = {
		mode,
		vcs_info,
		"%=%#Normal#",
		file_type,
		"%#Normal#",
		file_name,
		"%=%#StatusLineExtra#",
		lsp_info,
		line_info,
	}

	return table.concat(parts)
end

function M.setup()
	vim.opt_local.laststatus = 0
	Util.augroup("StatusLine", {
		event = "BufRead",
		command = function()
			vim.opt.showmode = false
			vim.opt_local.laststatus = 3
			vim.opt_local.statusline = [[%{%v:lua.require('plugins.ui.statusline').statusline()%}]]
		end,
	})
end

return M
