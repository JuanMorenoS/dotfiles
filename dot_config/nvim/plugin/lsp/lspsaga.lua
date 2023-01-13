local ok, plug = pcall(require, "lspsaga")

if not ok then
	return
end

plug.setup({})
