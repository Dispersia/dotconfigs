vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "biome" },
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				typescript = { "biome" },
			},
		})
	end,
})
