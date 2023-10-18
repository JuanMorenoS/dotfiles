-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Navigate Down" })
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Navigate Up" })
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Navigate Right" })
map("n", "<C-\\>", "<Cmd>TmuxNavigatePrevious<CR>", { desc = "Previous Window" })
