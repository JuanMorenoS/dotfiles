local ok, plug = pcall(require, "Comment")

if not ok then
	return
end

plug.setup()
