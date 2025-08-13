require('plugins.languages.flutter')
require('plugins.languages.wgsl')

local lsp_settings = require('plugins.languages.settings')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client then
      lsp_settings.on_attach(_, ev.buf)
    end
  end,
})

vim.lsp.config("*", {
  capabilities = lsp_settings.Capabilities,
})
