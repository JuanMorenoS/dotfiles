local ok, plug = pcall(require, "toggleterm")
if not ok then
	return
end

plug.setup({
	size = 5,
	open_mapping = [[<c-\>]],
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
