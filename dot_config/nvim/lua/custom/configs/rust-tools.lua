local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local rt = require "rust-tools"
local utils = require "core.utils"

function do_general_on_attach_stuff(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })
  -- on_attach(client, bufnr)
end

local opts = {
  tools = { -- rust-tools options
    -- how to execute terminal commands
    -- options right now: termopen / quickfix
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = true,
    on_attach = function(client, bufnr)
      do_general_on_attach_stuff(client, bufnr)
      vim.keymap.set("n", "<leader>kk", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set({ "n", "v" }, "<leader>aa", rt.code_action_group.code_action_group, { buffer = bufnr })
      vim.keymap.set("n", "<leader>rdb", rt.debuggables.debuggables)
      vim.keymap.set("n", "<leader>rr", rt.runnables.runnables)
      vim.keymap.set("n", "<leader>rsh", rt.inlay_hints.set)
      vim.keymap.set("n", "<leader>rhh", rt.inlay_hints.unset)
      vim.keymap.set("n", "<leader>rc", rt.open_cargo_toml.open_cargo_toml)
      vim.keymap.set("n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>")
      vim.keymap.set("n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>")
    end,

    capabilities = capabilities,

    checkOnSave = {
      allFeatures = true,
      overrideCommand = {
        "cargo",
        "clippy",
        "--workspace",
        "--message-format=json",
        "--all-targets",
        "--all-features",
      },
    }, -- rust-analyzer options

    -- debugging stuff
    dap = {
      adapter = {
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
      },
    },
  },
}

rt.setup(opts)
