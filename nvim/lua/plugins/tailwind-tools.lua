vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("tailwind-tools").setup({})
	end,
})
