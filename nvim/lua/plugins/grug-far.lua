vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local grug = require("grug-far")
    grug.setup({})

    vim.keymap.set("n", "<leader>gf", "<cmd>GrugFar<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>gr", function() grug.open({ prefills = { search = vim.fn.expand("<cword>") } }) end,
      { silent = true, noremap = true })
  end,
})
