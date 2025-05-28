local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lsp.bicep.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
  cmd = { "bicep-lsp" }
}

vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]
