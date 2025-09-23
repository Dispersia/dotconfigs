vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry"
      }
    })
  end,
})

