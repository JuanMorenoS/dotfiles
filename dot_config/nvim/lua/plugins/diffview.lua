-- Revision local de PRs: los buffers de octo son virtuales (octo://) y ahi no
-- funciona goto-definition. Diffview abre el diff sobre archivos REALES, asi
-- que roslyn, treesitter y el resto del LSP siguen vivos mientras lees los
-- cambios de otro.

---Rama base del repo actual: lo que apunte origin/HEAD, con respaldos.
---@return string
local function base_branch()
  local function run(cmd)
    local out = vim.fn.systemlist(cmd)
    return vim.v.shell_error == 0 and out[1] or nil
  end
  local head = run("git symbolic-ref --quiet refs/remotes/origin/HEAD")
  if head then
    return head:gsub("^refs/remotes/", "")
  end
  for _, b in ipairs({ "origin/main", "origin/master", "origin/develop" }) do
    if run("git rev-parse --verify --quiet " .. b) then
      return b
    end
  end
  return "HEAD~1"
end

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  opts = {
    enhanced_diff_hl = true,
    view = {
      -- Los tres paneles: base, cambios y el resultado en conflictos.
      merge_tool = { layout = "diff3_mixed" },
    },
    file_panel = {
      listing_style = "tree",
      win_config = { width = 32 },
    },
  },
  keys = {
    {
      "<leader>gD",
      function()
        -- "base...HEAD" usa el merge-base: solo lo que trae la rama, sin
        -- arrastrar commits que la base gano por su cuenta.
        vim.cmd("DiffviewOpen " .. base_branch() .. "...HEAD")
      end,
      desc = "Diffview: rama vs base (PR)",
    },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: historial del archivo" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: historial del repo" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Diffview: cerrar" },
  },
}
