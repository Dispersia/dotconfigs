vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("which-key").setup({})

    vim.o.timeout = true
    vim.o.timeoutlen = 50
  end,
})

