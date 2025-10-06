---@type vim.lsp.Config
return {
  cmd = {
    "roslyn",
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()), "--stdio"
  },
  filetypes = { "cs" },
  cmd_env = {
    Configuration = vim.env.Configuration or "Debug",
  },
  capabilities = {
    textDocument = {
      diagnostic = {
        dynamicRegistration = true,
      },
    },
  },
  root_markers = { "*.sln", "*.csproj", "*.git" }
}
