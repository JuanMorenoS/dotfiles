-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- HARD MODE! (:evil:)
local keymap = vim.keymap

keymap.set("", "<Left>", "<Nop>")
keymap.set("", "<Right>", "<Nop>")
keymap.set("", "<Up>", "<Nop>")
keymap.set("", "<Down>", "<Nop>")

-- Avoid cut
keymap.set("", "x", '"_x')
keymap.set("", "c", '"_c')
