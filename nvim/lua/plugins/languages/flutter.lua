local lsp_settings = require('plugins.languages.settings')

require('flutter-tools').setup {
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  lsp = {
    capabilities = lsp_settings.Capabilities,
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*.dart' },
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      lsp_settings.on_attach(client, bufnr)
    end,
  },
  widget_guides = {
    enabled = true,
  },
}
