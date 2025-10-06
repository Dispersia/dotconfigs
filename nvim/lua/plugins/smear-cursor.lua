vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("smear_cursor").setup({
      smear_between_buffers = true,
    })
  end,
})
