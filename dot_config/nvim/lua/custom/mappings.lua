local mappings = {}

mappings.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
  },
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

mappings.me = {
  n = {
    ["<leader>fo"] = { "<cmd> lua vim.lsp.buf.format()<CR>", "Format code" },
  },
}

return mappings
