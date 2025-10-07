---@type vim.lsp.Config
return {
  cmd = { "metals" },
  filetypes = { "scala", "sbt", "java" },
  root_markers = { "build.mill" }
}
