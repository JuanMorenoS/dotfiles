local ok_mason, mason = pcall(require, "mason")

local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")

local ok_mason_null_ls, mason_null_ls = pcall(require, "mason-null-ls")

if not ok_mason or not ok_mason_lsp or not ok_mason_null_ls then
	return
end

mason.setup()

mason_lsp.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"sumneko_lua",
		"jsonls",
		"graphql",
		"jdtls",
		"kotlin_language_server",
		"rust_analyzer",
		"yamlls",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"jq",
		"eslint_d",
		"ktlint",
		"yamllint",
	},
})
