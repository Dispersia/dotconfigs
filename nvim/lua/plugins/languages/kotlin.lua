local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

--[[nvim_lsp.kotlin_ls.setup({
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
})]]

vim.lsp.config['kotlin_ls'] = {
  cmd = { "kotlin-ls", "--stdio" },
  single_file_support = true,
  filetypes = { "kotlin" },
  root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" }
}
