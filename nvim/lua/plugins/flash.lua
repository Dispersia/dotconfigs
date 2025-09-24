vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		local flash = require("flash")
		flash.setup({})

		local opts = { noremap = true, silent = true }

		vim.keymap.set({ "n", "x", "o" }, "s", function()
			flash.jump()
		end, opts)
		vim.keymap.set({ "n", "x", "o" }, "S", function()
			flash.treesitter()
		end, opts)
		vim.keymap.set("o", "r", function()
			flash.remote()
		end, opts)
		vim.keymap.set({ "o", "x" }, "R", function()
			flash.treesitter_search()
		end, opts)
		vim.keymap.set("c", "<c-s>", function()
			flash.toggle()
		end, opts)
	end,
})
