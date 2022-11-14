local ok, plug = pcall(require, "gitsigns")
if not ok then
	return
end
plug.setup()
