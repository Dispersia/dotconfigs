vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("ts-comments").setup({})
	end,
})
