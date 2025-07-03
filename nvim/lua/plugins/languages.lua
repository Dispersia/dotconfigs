require('plugins.languages.flutter')
require('plugins.languages.rust')
require('plugins.languages.scala')
require('plugins.languages.wgsl')

local lspconfig = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')
local mason_lspconfig = require('mason-lspconfig')

vim.lsp.config("*", {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
})
