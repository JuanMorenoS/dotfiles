-- El extra lang.dotnet de LazyVim monta omnisharp, que esta en modo
-- mantenimiento y sufre en soluciones grandes (Scheduling tiene 49 proyectos,
-- Marketing.DataManagement 42). Aqui se cambia al LSP oficial actual de
-- Microsoft, roslyn_ls, que nvim-lspconfig ya soporta de fabrica.
return {
  -- Solo sirve para omnisharp: extiende su goto-definition a codigo decompilado.
  { "Hoffs/omnisharp-extended-lsp.nvim", enabled = false },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
        -- No hay F# en ninguno de los repos; evita instalar un server de mas.
        fsautocomplete = { enabled = false },
        roslyn_ls = {},
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "roslyn-language-server" })
      -- fantomas es formateador de F#, que no usas.
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "fantomas"
      end, opts.ensure_installed)
    end,
  },
}
