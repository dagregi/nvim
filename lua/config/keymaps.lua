-- Keymaps go here

--Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Finde file" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent files" })
--vim.keymap.set('n', '<leader>fb', builtin.todo_comments, { desc = "Todo comments" })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "List diagnostics" })

--Spectre
vim.keymap.set('n', '<leader>so', '<cmd>lua require("spectre").open()<CR>', {desc = "Open Spectre"})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {desc = "Search current word"})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {desc = "Search on current file"})


