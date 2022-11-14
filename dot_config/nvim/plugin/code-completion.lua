local ok_cmp, cmp = pcall(require, "cmp")

local ok_snip, snippets = pcall(require, "luasnip")

local ok_lspkind, lspkind = pcall(require, "lspkind")

if not ok_cmp or not ok_snip or not ok_lspkind then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			snippets.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<S-TAB>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<TAB>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
