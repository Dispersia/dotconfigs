local lsp_settings = require('plugins.languages.settings')

require('flutter-tools').setup {
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  lsp = {
    capabilities = lsp_settings.Capabilities,
    on_attach = lsp_settings.on_attach,
  },
  widget_guides = {
    enabled = true,
  },
}
