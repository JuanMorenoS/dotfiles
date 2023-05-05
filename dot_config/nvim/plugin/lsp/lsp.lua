local ok_lsp, lspconfig = pcall(require, "lspconfig")

local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

local ok_fidget, fidget = pcall(require, "fidget")

if not ok_lsp or not ok_cmp_lsp or not ok_fidget then
	return
end

fidget.setup({
	window = {
		blend = 0,
	},
})

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_lsp.default_capabilities()

local servers = {
	"cssls",
	"html",
	"tsserver",
	"gopls",
	"graphql",
	"jdtls",
	"kotlin_language_server",
	"rust_analyzer",
	"marksman",
        "pylsp"
}

for i, server in pairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end
