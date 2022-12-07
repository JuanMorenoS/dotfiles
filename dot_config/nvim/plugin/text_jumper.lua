local ok, plug = pcall(require, "leap")

if not ok then
	return
end

plug.add_default_mappings()
