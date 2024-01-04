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
	return string.format("%%#%s# %s ", hl_group, icon)
end
local function filename()
	local fname = fn.expand("%:~:.")
	return string.format(" %s %%m", fname)
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

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " %#DiagnosticError#󰅚 " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = " %#DiagnosticWarn# " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = " %#DiagnosticHint#󰌶 " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#DiagnosticInfo# " .. count["info"]
	end

	return errors .. warnings .. hints .. info .. "%#Normal#"
end

local vcs = function()
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
	return table.concat({
		"%#GitSignsAdd# ",
		git_info.head,
		" %#Normal#",
		"| ",
		added,
		changed,
		removed,
	})
end

local function lineinfo()
	return " %p%% %l:%c "
end

M.statusline = function()
	return table.concat({
		"%#Statusline#",
		get_mode(),
		"%#Normal#",
		vcs(),
		"%=%#Normal#",
		filetype(),
		"%#Normal#",
		filename(),
		"%=%#StatusLineExtra#",
		lsp(),
		lineinfo(),
	})
end

function M.setup()
	Util.augroup("StatusLine", {
		event = "BufEnter",
		command = function()
			vim.opt.showmode = false
			vim.opt_local.laststatus = 3
			vim.opt_local.statusline = [[%{%v:lua.require('plugins.ui.statusline').statusline()%}]]
		end,
	})
end

return M
