vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    require("blink.cmp").setup({
      fuzzy = {
        implementation = "lua",
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          treesitter_highlighting = true,
          window = { border = "single" },
        },
        menu = {
          border = "single",
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              kind_icon = {
                text = function(item)
                  local kind = require("lspkind").symbol_map[item.kind] or ""
                  return kind .. " "
                end,
                highlight = "CmpItemKind",
              },
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
      sources = {
        default = { "lsp", "path" },
      },
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = {
          function(cmp)
            if cmp.accept() then
              return true
            end
            -- Let autopairs handle CR for brace expansion
            local npairs_ok, npairs = pcall(require, "nvim-autopairs")
            if npairs_ok then
              local key = npairs.autopairs_cr()
              if key then
                vim.api.nvim_feedkeys(key, "n", false)
                return true
              end
            end
          end,
          "fallback",
        },

        ["<Tab>"] = {
          function(cmp)
            return cmp.select_next()
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            return cmp.select_prev()
          end,
          "snippet_backward",
          "fallback",
        },
      },
      signature = {
        enabled = true,
        window = { border = "single" },
      },
    })
  end,
})
