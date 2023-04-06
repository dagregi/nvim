-- Keymaps go here

--Spectre
vim.keymap.set("n", "<leader>sr", '<cmd>lua require("spectre").open()<CR>', { desc = "Open Spectre" })
vim.keymap.set(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word" }
)

--Better saving and quiting
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>W", "<cmd>w<CR>", { desc = "Save files" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })

-- Package manager
vim.keymap.set("n", "<leader>cm", "<Cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<A-l>", "<Cmd>Lazy<CR>", { desc = "Lazy" })

--Editor
vim.keymap.set("n", "<A-UP>", "<Cmd>move .-2<CR>==", { desc = "Move up" })
vim.keymap.set("n", "<A-DOWN>", "<Cmd>move .+1<CR>==", { desc = "Move down" })
vim.keymap.set("v", "<A-UP>", ":move '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("v", "<A-DOWN>", ":move '>+1<cr>gv=gv", { desc = "Move down" })

vim.keymap.set("v", ">", ">gv", { desc = "Visual shifting" })
vim.keymap.set("v", "<", "<gv", { desc = "Visual shifting" })

--Buffer
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete!<CR>", { desc = "Delete current" })
vim.keymap.set("n", "<leader>bD", "<Cmd>%bdelete<Bar>edit#<Bar>bdelete#<CR>", { desc = "Delete others" })
