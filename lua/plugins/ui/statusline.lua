local api = vim.api
local buf = vim.b

---@return string
local function get_mode()
	local mode = api.nvim_get_mode().mode
	if mode == "i" then
		return "INSERT"
	elseif mode == "n" then
		return "NORMAL"
	elseif mode == "v" then
		return "VISUAL"
	elseif mode == "V" then
		return "V-LINE"
	elseif mode == "" then
		return "V-BLOCK"
	elseif mode == "R" then
		return "REPLACE"
	elseif mode == "c" then
		return "COMMAND"
	else
		return mode
	end
end

---@return string | nil
local function get_branch_name()
	if vim.g.launched_by_shell then
		return nil
	end
	local branch = vim.fn.system({ "git", "branch", "--show-current" })
	if branch == "" or vim.v.shell_error ~= 0 then
		return nil
	end

	local branch_name, _ = branch:gsub("\n", "")
	return branch_name
end

---@return string | nil
local function get_file_name()
	local icon, hl_group = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"))
	local file = vim.fn.expand("%:~:.")
	if file == "" then
		return nil
	end
	local parts = {
		string.format("%%#%s#", hl_group),
		icon,
		" %#Normal#",
		file,
	}
	return table.concat(parts)
end

local group = api.nvim_create_augroup("statusline", { clear = true })
api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
	group = group,
	callback = function()
		buf.branch_name = get_branch_name()
		buf.file_name = get_file_name()
	end,
})

---@return string | nil
local function get_diagnostics()
	local diagnostics = vim.diagnostic.get(0)
	if #diagnostics == 0 or api.nvim_get_mode().mode:match("^i") then
		return nil
	end

	local severities = {
		ERROR = { match = "Error", count = 0 },
		WARN = { match = "Warn", count = 0 },
		HINT = { match = "Hint", count = 0 },
		INFO = { match = "Info", count = 0 },
	}

	for _, v in ipairs(diagnostics) do
		for k, _ in pairs(severities) do
			if v.severity == vim.diagnostic.severity[k] then
				severities[k].count = severities[k].count + 1
			end
		end
	end

	local output = {}
	for _, v in pairs(severities) do
		if v.count > 0 then
			table.insert(
				output,
				table.concat({
					"%#DiagnosticVirtualText",
					v.match,
					"#",
					v.count,
					"%*",
				})
			)
		end
	end

	table.sort(output, function(a, b)
		local sort_order = { Error = 1, Warn = 2, Hint = 3, Info = 4 }
		local a_sev = a:match("(%u%l+)#")
		local b_sev = b:match("(%u%l+)#")

		return sort_order[a_sev] < sort_order[b_sev]
	end)

	return table.concat(output, " ")
end

---@return string
local function get_progress()
	local p = api.nvim_eval_statusline("%p %l:%c", {}).str
	return p
end

---@param branch string | nil
---@param file string | nil
---@return string
local function generate_left(branch, file)
	branch = branch or buf.branch_name
	file = file or buf.file_name

	local left = {}
	table.insert(left, get_mode())
	if branch then
		table.insert(left, branch)
	end
	if file ~= "" then
		table.insert(left, file)
	end
	left = { table.concat(left, " | ") }

	local modified_flag = api.nvim_eval_statusline("%m", {}).str
	if modified_flag ~= "" then
		table.insert(left, modified_flag)
	end

	return table.concat(left, " ")
end

---@return string
local function generate_right()
	local right = {}
	table.insert(right, get_diagnostics())
	table.insert(right, get_progress())
	right = { table.concat(right, " | ") }

	return table.concat(right, " ")
end

---@return string
function Status_Line()
	local left_string = generate_left()
	local left_string_length = api.nvim_eval_statusline(left_string, { maxwidth = 0 }).width

	local right_string = generate_right()
	local right_string_length = api.nvim_eval_statusline(right_string, {}).width

	local divider = " | "
	local length = left_string_length + divider:len() + right_string_length
	local overflow = length - api.nvim_win_get_width(0)
	if overflow < 0 then
		divider = "%="
	end

	return table.concat({ "%<", left_string, divider, right_string })
end

vim.o.laststatus = 3
vim.o.statusline = "%{%v:lua.Status_Line()%}"
