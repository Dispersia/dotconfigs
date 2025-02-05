local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lsp.zls.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach
}

vim.g.zig_fmt_autosave = 0
