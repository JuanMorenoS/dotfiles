vim.o.relativenumber = true
vim.o.number = true
vim.opt.colorcolumn = "80"


-- HARD MODE! (:evil:) 
local keymap = vim.keymap

keymap.set("", "<Left>", "<Nop>")
keymap.set("", "<Right>", "<Nop>")
keymap.set("", "<Up>", "<Nop>")
keymap.set("", "<Down>", "<Nop>")


-- Avoid cut
keymap.set("", "x", '"_x')
keymap.set("", "c", '"_c')


