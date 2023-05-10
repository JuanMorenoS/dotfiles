local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  "tsserver",
  "html",
  "cssls",
  "lua_ls",
  "jsonls",
  "graphql",
  "jdtls",
  "kotlin_language_server",
  "rust_analyzer",
  "yamlls",
  "marksman",
  "pylsp",
  "denols",
}

M.mason_null_ls = {
  "prettier",
  "stylua",
  "jq",
  "eslint_d",
  "ktlint",
  "yamllint",
  "rustfmt",
  "markdownlint",
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    group_empty = true,
    icons = {
      git_placement = "signcolumn",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
}

return M
