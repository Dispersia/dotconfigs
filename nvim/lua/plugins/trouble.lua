vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("trouble").setup({})

		vim.keymap.set("n", "<leader>xx", "<cmd>Trouble giagnostics toggle<cr>", { noremap = true, silent = true })
	end,
})
