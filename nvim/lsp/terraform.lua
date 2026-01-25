---@type vim.lsp.Config
return {
  cmd = { "terraform-lsp" },
  filetypes = { "terraform", "tf" },
  root_markers = { ".git" },
}
