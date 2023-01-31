local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
local servers = { "omnisharp"}

lspconfig["omnisharp"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "dotnet", "/home/ant/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll"},
  root_dir = util.root_pattern("src/*_NET.sln") or util.root_pattern("src/*_NET.csproj")
}
