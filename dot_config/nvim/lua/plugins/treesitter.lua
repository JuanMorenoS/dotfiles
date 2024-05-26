return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "rust",
        "ron",
        "toml",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "ron",
        "rust",
        "toml",
        "dockerfile",
      })
    end
    opts.highlight = { enable = true }
    opts.indent = { enable = true }
  end,
}
