vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		local npairs = require("nvim-autopairs")
		local ts_conds = require("nvim-autopairs.ts-conds")

		npairs.setup({
			check_ts = true,
			ts_config = {
				rust = {},
			},
		})

		npairs.get_rule("'")[2]:with_pair(ts_conds.is_not_ts_node({ "type_arguments", "bounded_type" }))
	end,
})
