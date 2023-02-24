local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.jq,
		formatting.ktlint,
		formatting.rustfmt,
		diagnostics.yamllint,
		diagnostics.eslint_d,
		diagnostics.markdownlint,
	},
})
