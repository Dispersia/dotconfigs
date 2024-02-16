local lsp_settings = require('plugins.languages.settings')

require('flutter-tools').setup {
  lsp = {
    capabilities = lsp_settings.Capabilities,
    on_attach = function(client, bufnr)
      lsp_settings.on_attach(client, bufnr)

      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*.dart' },
        callback = function()
          vim.lsp.buf.format()
        end,
      })
  }
}
