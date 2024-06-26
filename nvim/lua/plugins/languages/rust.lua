local nvim_lsp = require('lspconfig')
local lsp_settings = require('plugins.languages.settings')

require('rust-tools').setup({
  tools = {
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    capabilities = lsp_settings.Capabilities,
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        pattern = 'Cargo.toml',
        callback = function()
          require('crates').toggle()
        end,
      })

      lsp_settings.on_attach(client, bufnr)
    end,
    flags = {
      debounce_text_changes = 250,
    },
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true
        },
        diagnostics = {
          disabled = { "unresolved-proc-macro" }
        },
      },
    },
  }
})
