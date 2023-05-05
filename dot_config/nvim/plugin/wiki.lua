local ok, plug = pcall(require, "neorg")

if not ok then
	return
end

plug.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.norg.concealer"] = {
			config = {
				icon_preset = "varied",
				markup_preset = "braved",
			},
		}, -- Adds pretty icons to your documents
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					work = "~/notes/work/",
					home = "~/notes/home/",
				},
				default_workspace = "work",
				autochdir = true,
			},
		},
                ["core.integrations.treesitter"] = {

                }
	},
})
