local ok, plug = pcall(require, "nvim-web-devicons")
if not ok then
	return
end

plug.get_icons()
