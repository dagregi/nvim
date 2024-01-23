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

function M.on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(args)
        if args.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

return M
