local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lsp.bicep.setup {
  cmd = { "dotnet", "/home/dispe/programs/bicep-server/Bicep.LangServer.dll" },
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
}
