local nvim_lspconfig = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

nvim_lspconfig.ts_ls.setup({
  capabilities = lsp_settings.Capabilities,
  on_attach = function(client, bufnr)
    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup({})
    ts_utils.setup_client(client)

    lsp_settings.on_attach(client, bufnr)
  end,
})

nvim_lspconfig.tailwindcss.setup({
  capabilities = lsp_settings.Capabilities,
  on_attach = lsp_settings.on_attach,
  root_dir = function(fname)
    local root_pattern = nvim_lspconfig.util.root_pattern("tailwind.config.cjs", "tailwind.config.js",
      "postcss.config.js")
    return root_pattern(fname)
  end
})
