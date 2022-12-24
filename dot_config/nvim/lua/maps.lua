local keymap = vim.keymap

function mapMode(mode, keys, func, desc)
	keymap.set(mode, keys, func, { desc = desc })
end

function map(keys, func, desc)
	keymap.set("n", keys, func, { desc = desc })
end

vim.g.mapleader = " "

-- Generals
mapMode("i", "jk", "<ESC>", "Exit with jk key in insert mode")
map("<leader>nh", ":nohl<CR>", "Remove the highlight")

-- Increment / Decrement
map("+", "<C-a>", "Increase a number [+]")
map("-", "<C-x>", "Decrease a number [-]")

-- Select all
map("<C-a>", "gg<S-v>G", "Select [a]ll")

-- Avoid cut

keymap.set("", "x", '"_x')
keymap.set("", "c", '"_c')

-- Remove arrows (HARD MODE)
keymap.set("", "<Left>", "<Nop>")
keymap.set("", "<Right>", "<Nop>")
keymap.set("", "<Up>", "<Nop>")
keymap.set("", "<Down>", "<Nop>")

keymap.set("i", "<Left>", "<Nop>")
keymap.set("i", "<Right>", "<Nop>")
keymap.set("i", "<Up>", "<Nop>")
keymap.set("i", "<Down>", "<Nop>")

--- Window / tabs movements

-- Move window
map("sh", "<C-w>h", "Move [h] in the split window")
map("sj", "<C-w>j", "Move [j] in the split window")
map("sk", "<C-w>k", "Move [k] in the split window")
map("sl", "<C-w>l", "Move [l] in the split window")

-- New Tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
keymap.set("n", "tx", ":tabclose<Return>", { silent = true })
-- Split window
map("ss", ":split<Return><C-w>w", "[S]plit window (horizontal)")
map("sv", ":vsplit<Return><C-w>w", "[S]plit window [v]ertical")

-- Open file-explorer
keymap.set("", "<C-.>", ":NvimTreeToggle<Return>")

-- Finder
map("<leader>ff", "<cmd>Telescope find_files<cr>", "[F]ind [f]iles")
map("<leader>fg", "<cmd>Telescope live_grep<cr>", "[F]ind text like [g]rep")
map("<leader>fb", "<cmd>Telescope buffers<cr>", "[F]ind open [b]uffers")
map("<leader>fh", "<cmd>Telescope help_tags<cr>", "[F]ind in all the [h]elps")
map("<leader>fk", "<cmd>Telescope keymaps<cr>", "[F]ind [k]eymaps")

-- text jumper
mapMode({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward-to)", "Move to the next word given two chars")
mapMode({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward-to)", "Move to the previous word given two chars")
