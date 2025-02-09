local lspconfig = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

lspconfig.fsautocomplete.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach
}
