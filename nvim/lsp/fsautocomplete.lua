local util = require("util")

---@type vim.lsp.Config
return {
  cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
  filetypes = { "fsharp" },
  root_markers = { '*.fsproj', '.slnx', '.sln', '.fsproj', '.git' },
  init_options = {
    AutomaticWorkspaceInit = true
  },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern('*.slnx', '*.sln', '*.fsproj', '.git')(fname))
  end,
}
