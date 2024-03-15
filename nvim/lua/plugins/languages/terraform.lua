local lspconfig = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

lspconfig.terraformls.setup{
  capabilities = lsp_settings.Capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      pattern = { '*.tf', '*.tfvars' },
      callback = function()
        vim.lsp.buf.format()
      end,
    })
    lsp_settings.on_attach(client, bufnr)
  end,
}
