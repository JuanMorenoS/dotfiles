local keymap = vim.keymap

function mapMode(mode, keys, func, desc)
	keymap.set(mode, keys, func, { desc = desc })
end

function nmap(keys, func, desc)
	keymap.set("n", keys, func, { desc = desc })
end

vim.g.mapleader = " "

-- Generals
mapMode("i", "jk", "<ESC>", "Exit with jk key in insert mode")
nmap("<leader>nh", ":nohl<CR>", "Remove the highlight")
nmap("W", ":w<CR>", "Shortcut to [W]rite")
nmap("Q", ":q<CR>", "Shortcut to [Q]uit")

-- Increment / Decrement
nmap("+", "<C-a>", "Increase a number [+]")
nmap("-", "<C-x>", "Decrease a number [-]")

-- Select all
nmap("<C-a>", "gg<S-v>G", "Select [a]ll")

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
nmap("<C-h>", "<C-w>h", "Move [h] in the split window")
nmap("<C-j>", "<C-w>j", "Move [j] in the split window")
nmap("<C-k>", "<C-w>k", "Move [k] in the split window")
nmap("<C-l>", "<C-w>l", "Move [l] in the split window")

-- New Tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
keymap.set("n", "tx", ":tabclose<Return>", { silent = true })
-- Split window
nmap("ss", ":split<Return><C-w>w", "[S]plit window (horizontal)")
nmap("sv", ":vsplit<Return><C-w>w", "[S]plit window [v]ertical")

-- Open file-explorer
keymap.set("", "<leader>.", ":NvimTreeToggle<Return>")

-- Finder
nmap("<leader>ff", "<cmd>Telescope find_files<cr>", "[F]ind [f]iles")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>", "[F]ind text like [g]rep")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>", "[F]ind open [b]uffers")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>", "[F]ind in all the [h]elps")
nmap("<leader>fk", "<cmd>Telescope keymaps<cr>", "[F]ind [k]eymaps")

-- text jumper
mapMode({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward-to)", "Move to the next word given two chars")
mapMode({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward-to)", "Move to the previous word given two chars")

nmap("gh", "<cmd>Lspsaga lsp_finder<CR>", "[g]o definition ")
nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ction")
nmap("gr", "<cmd>Lspsaga rename<CR>", "rename a variable")
nmap("gd", "<cmd>Lspsaga peek_definition<CR>", "[p]eek definition")
nmap("gD", "<cmd>Lspsaga goto_definition<CR>", "[g]o to definition")
nmap("K", "<cmd>Lspsaga hover_doc ++keep<CR>", "Open documentation")

nmap("<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", "[s]how [l]ine diagnostics")
nmap("<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "[s]how [c]ursor diagnostics")
nmap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", "[s]how [b]uffer diagnostics")

mapMode({ "n", "v", "x" }, "<leader>fo", "<cmd> lua vim.lsp.buf.format()<CR>", "[F]ormat the current buffer")
