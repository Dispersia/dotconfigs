vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("lsp-status").register_progress()
	end,
})
