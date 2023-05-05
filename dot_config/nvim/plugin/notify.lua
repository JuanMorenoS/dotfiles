local ok, plug = pcall(require, "notify")

if not ok then
	return
end

plug.setup({
	background_colour = "#000000",
})
