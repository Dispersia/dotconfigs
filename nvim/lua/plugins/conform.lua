vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "biome" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        typescript = { "biome" },
      },
      default_format_opts = {
        lsp_format = "fallback"
      }
    })
  end,
})
