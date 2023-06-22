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

-- remove the arrow keys for normal MODE
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")


