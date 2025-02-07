local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

nvim_lsp.wgsl_analyzer.setup({
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach
})
