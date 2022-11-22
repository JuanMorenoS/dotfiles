local ok, plug = pcall(require, "alpha")

if not ok then
	return
end

plug.setup(require("alpha.themes.startify").config)
