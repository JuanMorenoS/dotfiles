local ok, plug = pcall(require, "catppuccin")
if not ok then
	return
end

plug.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	term_colors = true,
	transparent_background = true,
	integrations = {
		nvimtree = true,
		mason = true,
		gitsigns = true,
		markdown = true,
		lsp_saga = true,
		cmp = true,
		dashboard = true,
		telescope = true,
		leap = false,
		fidget = true,
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})
vim.cmd.colorscheme("catppuccin")
