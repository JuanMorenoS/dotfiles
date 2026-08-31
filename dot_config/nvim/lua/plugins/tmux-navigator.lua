return {
  "christoomey/vim-tmux-navigator",
  -- Dentro de herdr sobra y ademas robaria ctrl+hjkl al puente de
  -- config/keymaps.lua. Solo se carga cuando el multiplexor es tmux.
  enabled = vim.env.HERDR_ENV ~= "1",
  event = "VeryLazy",
}
