local lsp_settings = require('plugins.languages.settings')

require('flutter-tools').setup{
  lsp = {
    capabilities = lsp_settings.Capabilities,
    on_attach = function (client, bufnr)
      lsp_settings.on_attach(client, bufnr)

      vim.api.nvim_exec(
        [[
        augroup AutoFmt
          autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync(nil, 200)
        augroup end
        ]],
        false
      )
    end
  }
}

