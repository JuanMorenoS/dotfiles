local ok, plug = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

plug.setup({
	ensure_installed = "all",
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
	},
	autopairs = { enable = true },
	autotag = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = false },
})
