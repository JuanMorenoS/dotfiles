local overrides = require "custom.configs.overrides"
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-null-ls").setup {
        ensure_installed = overrides.mason_null_ls,
      }
      require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = overrides.mason,
      }
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = overrides.mason_null_ls,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return overrides.nvimtree
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rust-tools"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
}

require "custom.configs.nvimtree"

return plugins
