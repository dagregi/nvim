local fmt = string.format
local icons = {
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
}

local M = {}

function M.augroup(name, ...)
	local commands = { ... }
	assert(name ~= "User", "The name of an augroup CANNOT be User")
	assert(#commands > 0, fmt("You must specify at least on autocommand for %s", name))
	local group_id = vim.api.nvim_create_augroup(name, { clear = true })
	for _, autocmd in ipairs(commands) do
		local is_callback = type(autocmd.command) == "function"
		vim.api.nvim_create_autocmd(autocmd.event, {
			group = group_id,
			pattern = autocmd.pattern,
			desc = autocmd.desc,
			callback = is_callback and autocmd.command or nil,
			command = not is_callback and autocmd.command or nil,
			once = autocmd.once,
			nested = autocmd.nested,
			buffer = autocmd.buffer,
		})
	end
	return group_id
end

function M.setup()
	for name, icon in pairs(icons) do
		name = "DiagnosticSign" .. name:gsub("^%l", string.upper)
		vim.fn.sign_define(name, { text = icon, texthl = name })
	end

	vim.diagnostic.config({
		severity_sort = true,
		virtual_text = {
			source = false,
			severity = vim.diagnostic.severity.ERROR,
			spacing = 1,
			format = function(d)
				local level = vim.diagnostic.severity[d.severity]
				return fmt("%s %s", icons[level:lower()], d.message)
			end,
		},
		float = {
			header = "",
			source = false,
			border = "rounded",
			prefix = function(d)
				local level = vim.diagnostic.severity[d.severity]
				local prefix = fmt("%s ", icons[level:lower()])
				return prefix, "DiagnosticFloating" .. level
			end,
			format = function(d)
				return d.source and fmt("%s: %s", string.gsub(d.source, "%.$", ""), d.message) or d.message
			end,
			suffix = function(d)
				local code = d.code
				local suffix = code and fmt(" (%s)", code) or ""
				return suffix, "Comment"
			end,
		},
	})

	M.augroup("LspDiagnostics", {
		event = "CursorHold",
		desc = "LSP: show diagnostics",
		command = function()
			vim.diagnostic.open_float({ scope = "cursor", focus = false })
		end,
	})
end

return M
