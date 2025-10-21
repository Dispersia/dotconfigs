vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local kulala = require("kulala")

    kulala.setup({})

    vim.keymap.set("n", "<leader>Ro", function() kulala.open() end, { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>Rs", function() kulala.run() end, { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>Rb", function() kulala.scratchpad() end, { silent = true, noremap = true })
  end,
})
