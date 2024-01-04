local lsp_settings = require('plugins.languages.settings')

require('lspconfig').html.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
}

