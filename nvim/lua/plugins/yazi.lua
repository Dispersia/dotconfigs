vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("yazi").setup({
			open_for_directories = true,
		})

		vim.keymap.set("n", "<leader>-", "<cmd>Yazi<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { noremap = true, silent = true })
	end,
})
