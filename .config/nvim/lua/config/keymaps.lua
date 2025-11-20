-- ~/.config/nvim/lua/config/keymaps.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlights with Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })