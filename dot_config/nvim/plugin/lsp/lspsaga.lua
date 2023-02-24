local ok, plug = pcall(require, "lspsaga")

if not ok then
	return
end

plug.setup({
	ui = {
		colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},
})
