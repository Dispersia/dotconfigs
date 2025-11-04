local util = require("util")

---@type vim.lsp.Config
return {
	cmd = { "bicep-lsp" },
	filetypes = { "bicep" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern('*.bicep', '.git')(fname))
  end,
}
