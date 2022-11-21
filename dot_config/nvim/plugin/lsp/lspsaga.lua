local ok, plug = pcall(require, "lspsaga")

if not ok then
	return
end

plug.init_lsp_saga({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<S-Tab>", next = "<Tab>" },
	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
})
