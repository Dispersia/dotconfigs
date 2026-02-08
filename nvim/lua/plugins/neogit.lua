vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("neogit").setup()

		vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
	end,
})
