local M = {}

function Harpoon_Files()
	local harpoon = require("harpoon")
	vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = "#6e6a86" })
	vim.api.nvim_set_hl(0, "HarpoonActive", { fg = "#9ccfd8" })
	vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = "#ebbcba" })

	local contents = {}
	local marks_length = harpoon:list():length()
	local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
	for index = 1, marks_length do
		local harpoon_file_path = harpoon:list():get(index).value
		local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ":t")

		if current_file_path == harpoon_file_path then
			contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
		else
			contents[index] = string.format("%%#HarpoonInactive# %s. %s ", index, file_name)
		end
	end

	return table.concat(contents)
end

function M.setup()
	vim.o.winbar = "%{%v:lua.Harpoon_Files()%}%#Normal#%=%f "
end

return M
