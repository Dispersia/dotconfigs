vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "rust",
        "toml"
      }
    })
  end,
})