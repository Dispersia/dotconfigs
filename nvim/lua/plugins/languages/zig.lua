local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lsp.zls.setup {
  capabilities = lsp_settings.Capabilities,
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    lsp_settings.on_attach(client, bufnr)
  end,
}

