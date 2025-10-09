vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })

    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  end,
})
