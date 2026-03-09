vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("nvim-treesitter.config").setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true }
		})
	end,
})
