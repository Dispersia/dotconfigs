require('plugins.languages.flutter')
require('plugins.languages.rust')
require('plugins.languages.scala')
require('plugins.languages.wgsl')

local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

for _, _settings in pairs(mason_lspconfig.get_installed_servers()) do
  lspconfig[_settings].setup({
    capabilities = lsp_settings.Capabilities,
    on_attach = lsp_settings.on_attach,
  })
end;
