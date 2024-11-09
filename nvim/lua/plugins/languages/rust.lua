local lsp_settings = require('plugins.languages.settings')

vim.g.rustaceanvim = {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      show_parameters_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    }
  },
  server = {
    capabilities = lsp_settings.Capabilities,
    on_attach = function(client, bufnr)
      lsp_settings.on_attach(client, bufnr)
    end
  },
  default_settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
        extraArgs = { "--no-deps" },
      },
      procMacro = {
        enable = true,
        ignored = {
          ["async-trait"] = { "async_trait" },
          ["napi-derive"] = { "napi" },
          ["async-recursion"] = { "async_recursion" }
        }
      }
    }
  }
}
