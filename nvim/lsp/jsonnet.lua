---@type vim.lsp.Config
return {
  cmd = { "jsonnet-language-server" },
  filetypes = { "jsonnet" },
  root_markers = { ".git" },
}
