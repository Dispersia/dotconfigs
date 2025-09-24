vim.api.nvim_create_autocmd("FileType", {
	once = true,
	pattern = "cs",
	callback = function()
		require("roslyn").setup({})
	end,
})
