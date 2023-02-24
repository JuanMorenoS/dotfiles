local ok, plug = pcall(require, "feline")
if not ok then
	return
end

local ctp_feline = require("catppuccin.groups.integrations.feline")

ctp_feline.setup({})

plug.setup({
	components = ctp_feline.get(),
})
