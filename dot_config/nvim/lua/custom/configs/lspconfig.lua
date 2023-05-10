local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "cssls",
  "html",
  "tsserver",
  "gopls",
  "graphql",
  "jdtls",
  "kotlin_language_server",
  "rust_analyzer",
  "marksman",
  "pylsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
