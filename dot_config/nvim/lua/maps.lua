local keymap = vim.keymap

vim.g.mapleader = " "

-- Generals
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Avoid cut

keymap.set("", "x", '"_x')
keymap.set("", "c", '"_c')
-- keymap.set('', 'd', '"_d')

-- Remove arrows
keymap.set("", "<Left>", "<Nop>")
keymap.set("", "<Right>", "<Nop>")
keymap.set("", "<Up>", "<Nop>")
keymap.set("", "<Down>", "<Nop>")

keymap.set("i", "<Left>", "<Nop>")
keymap.set("i", "<Right>", "<Nop>")
keymap.set("i", "<Up>", "<Nop>")
keymap.set("i", "<Down>", "<Nop>")

--- Window / tabs movements
--
-- Move window
keymap.set("n", "<leader><leader>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sl", "<C-w>l")

-- New Tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
keymap.set("n", "tx", ":tabclose<Return>", { silent = true })
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Open file-explorer
keymap.set("", "<C-.>", ":NvimTreeToggle<Return>")

-- Finder
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_strings<cr>", {})
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})

-- text jumper
vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward-to)")
vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward-to)")
