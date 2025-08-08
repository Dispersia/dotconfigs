require('plugins.languages.flutter')
require('plugins.languages.rust')
require('plugins.languages.scala')
require('plugins.languages.wgsl')

local lsp_settings = require('plugins.languages.settings')

vim.lsp.config("*", {
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.fs",
  callback = function()
    vim.bo.filetype = "fsharp"
  end,
})
