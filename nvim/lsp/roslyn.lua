local util = require("util")

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
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern("*.slnx", "*.sln", "*.csproj", ".git")(fname))
  end,
}
