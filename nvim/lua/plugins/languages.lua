require('plugins.languages.flutter')
require('plugins.languages.rust')
require('plugins.languages.wgsl')

local lsp_settings = require('plugins.languages.settings')

vim.lsp.config("*", {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
})
