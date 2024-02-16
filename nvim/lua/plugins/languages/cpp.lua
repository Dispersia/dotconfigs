local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lsp.clangd.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = function(client, bufnr)
    lsp_settings.on_attach(client, bufnr)
  end,
}
