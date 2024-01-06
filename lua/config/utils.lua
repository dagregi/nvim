local M = {}
function M.remap(mode, keys, func, desc, opts)
	opts = opts or { desc = "" }
	if desc then
		opts = { desc = opts.desc .. desc }
	end
	vim.keymap.set(mode, keys, func, opts)
end
function M.augroup(name, ...)
	local commands = { ... }
	assert(name ~= "User", "The name of an augroup CANNOT be User")
	assert(#commands > 0, string.format("You must specify at least on autocommand for %s", name))
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

M.use_lazy_file = true
M.lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

-- Properly load file based plugins without blocking the UI
function M.lazy_file()
	M.use_lazy_file = M.use_lazy_file and vim.fn.argc(-1) > 0

	-- Add support for the LazyFile event
	local Event = require("lazy.core.handler.event")

	if M.use_lazy_file then
		-- We'll handle delayed execution of events ourselves
		Event.mappings.LazyFile = { id = "LazyFile", event = "User", pattern = "LazyFile" }
		Event.mappings["User LazyFile"] = Event.mappings.LazyFile
	else
		-- Don't delay execution of LazyFile events, but let lazy know about the mapping
		Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
		Event.mappings["User LazyFile"] = Event.mappings.LazyFile
		return
	end

	local events = {} ---@type {event: string, buf: number, data?: any}[]

	local done = false
	local function load()
		if #events == 0 or done then
			return
		end
		done = true
		vim.api.nvim_del_augroup_by_name("lazy_file")

		---@type table<string,string[]>
		local skips = {}
		for _, event in ipairs(events) do
			skips[event.event] = skips[event.event] or Event.get_augroups(event.event)
		end

		vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile", modeline = false })
		for _, event in ipairs(events) do
			if vim.api.nvim_buf_is_valid(event.buf) then
				Event.trigger({
					event = event.event,
					exclude = skips[event.event],
					data = event.data,
					buf = event.buf,
				})
				if vim.bo[event.buf].filetype then
					Event.trigger({
						event = "FileType",
						buf = event.buf,
					})
				end
			end
		end
		vim.api.nvim_exec_autocmds("CursorMoved", { modeline = false })
		events = {}
	end

	-- schedule wrap so that nested autocmds are executed
	-- and the UI can continue rendering without blocking
	load = vim.schedule_wrap(load)

	M.augroup("lazy_file", {
		event = M.lazy_file_events,
		command = function(event)
			table.insert(events, event)
			load()
		end,
	})
end

return M
