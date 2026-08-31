-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Navegacion de panes con ctrl+hjkl: primero mueve entre ventanas de nvim y,
-- si ya estabas en el borde, cede el foco al pane vecino del multiplexor.
if vim.env.HERDR_ENV == "1" then
  -- Dentro de herdr. herdr deja ctrl+hjkl libre a proposito (sus focus_pane_*
  -- viven bajo el prefix), asi que nvim decide a donde va cada pulsacion.
  local dirs = { h = "left", j = "down", k = "up", l = "right" }
  for key, dir in pairs(dirs) do
    map("n", "<C-" .. key .. ">", function()
      local from = vim.api.nvim_get_current_win()
      vim.cmd.wincmd(key)
      if from == vim.api.nvim_get_current_win() then
        vim.system({ "herdr", "pane", "focus", "--direction", dir, "--current" })
      end
    end, { desc = "Navigate " .. dir .. " (nvim/herdr)" })
  end
else
  -- Fuera de herdr el multiplexor es tmux, via vim-tmux-navigator.
  map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
  map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Navigate Down" })
  map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Navigate Up" })
  map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Navigate Right" })
  map("n", "<C-\\>", "<Cmd>TmuxNavigatePrevious<CR>", { desc = "Previous Window" })
end
