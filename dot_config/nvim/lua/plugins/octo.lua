return {
  "pwntester/octo.nvim",
  -- opts como funcion, no tabla: el extra de LazyVim tambien usa una funcion
  -- para fijar el picker, y las de los plugins del usuario corren al final.
  opts = function(_, opts)
    -- El extra fuerza esto a true e inyecta fragmentos de ProjectV2 al
    -- timeline del PR; esos campos exigen el scope `read:project`, que el
    -- token de gh no tiene. El default de octo es false.
    -- Si algun dia usas Projects v2: gh auth refresh -s read:project
    opts.default_to_projects_v2 = false

    -- El picker de fzf-lua de octo esta roto: indexa formatted_pulls por
    -- entry.ordinal ("<num> <titulo>") pero le manda a fzf otra cadena
    -- (con ANSI, y con el indicador de stack si el PR esta apilado), asi
    -- que formatted_pulls[selected[1]] sale nil y revienta al previsualizar
    -- y al abrir. snacks.picker no pasa por ese codigo.
    opts.picker = "snacks"
  end,
}
