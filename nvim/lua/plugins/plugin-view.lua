vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local plugin_view = require("plugin-view")
    plugin_view.setup({})

    vim.keymap.set("n", "<leader>p", function() plugin_view.open() end)
  end,
})
