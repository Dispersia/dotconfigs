---@type vim.lsp.Config
return {
  cmd = { "slint-lsp" },
  filetypes = { "slint" },
  root_markers = { "Cargo.toml", ".git" },
}
