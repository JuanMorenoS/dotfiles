local ok, plug = pcall(require, "feline")
if not ok then
	return
end
plug.setup()
