local map = vim.keymap.set

-- Disables Space default behavior in 'normal' and 'visual' mode
map({ "n", "v" }, " ", "<Nop>", { silent = true })
-- Removes highlight when sarch for pattern
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- Delete buffer
map("n", "<a-d>", "<cmd>bd<cr>", { noremap = true, desc = "Delete buffer" })
-- Close current window
map("n", "<a-q>", "<cmd>q<cr>", { noremap = true, desc = "Close window" })
-- Save File
map("n", "<leader>s", "<cmd>write<cr>", { noremap = true, desc = "Save File" })
-- Creates splits to the right
map("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = "[V]ertical [S]plit" })
-- Creates splits below
map("n", "<leader>hs", "<cmd>split<cr>", { desc = "[H]orizontal [S]plit" })
-- Navigate splits
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Naviagate buffers
map("n", "<a-left>", "<cmd>bnext<cr>", { noremap = true, silent = true, desc = "Navigate next buffer" })
map("n", "<a-right>", "<cmd>bprevious<cr>", { noremap = true, silent = true, desc = "Navigate previous buffer" })
-- Modify Split Size
map("n", "<c-up>", "<cmd>resize -2<CR><cr>", { noremap = true, silent = true, desc = "Resize split Up" })
map("n", "<c-down>", "<cmd>resize +2<CR><cr>", { noremap = true, silent = true, desc = "Resize split Down" })
map("n", "<c-left>", "<cmd>vertical resize -2<cr>", { noremap = true, silent = true, desc = "Resize split Left" })
map("n", "<c-right>", "<cmd>vertical resize +2<cr>", { noremap = true, silent = true, desc = "Resize split Right" })
-- Exit terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
