local nvim_lspconfig = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lspconfig.tsserver.setup({
  capabilities = lsp_settings.Capabilities,
  on_attach = function(client, bufnr)
    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup({})
    ts_utils.setup_client(client)

    lsp_settings.on_attach(client, bufnr)
  end,
})
