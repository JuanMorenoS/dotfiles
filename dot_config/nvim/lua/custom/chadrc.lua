---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "catppuccin",
  statusline = {
    theme = "minimal",
    separator_style = "round"
  },
  tabufline = {
    lazyload = true
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
