-- Keymaps go here

--lsp things
vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, { desc = "Format document" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

--Better saving and quiting
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", { desc = "Save files" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit" })

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

-- yanked from ThePrimeagen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Better paste" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Better yank" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Better delete" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
