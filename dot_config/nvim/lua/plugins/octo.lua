return {
  "pwntester/octo.nvim",
  opts = {
    -- El extra de LazyVim fuerza esto a true. Eso inyecta los fragmentos
    -- AddedToProjectV2Event / RemovedFromProjectV2Event /
    -- ProjectV2ItemStatusChangedEvent al timeline del PR, y esos campos
    -- exigen el scope `read:project`, que el token de gh no tiene.
    -- El default de octo es false. Si algun dia usas GitHub Projects v2,
    -- corre `gh auth refresh -s read:project` y pon esto en true.
    default_to_projects_v2 = false,
  },
}
