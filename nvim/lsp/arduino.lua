return {
  cmd = { "arduino-language-server", "-cli-config", "/home/dispe/.arduino15/arduino-cli.yaml" },
  filetypes = { "arduino", "cpp" },
  root_markers = { "sketch.yaml" },
  capabilities = {
    textDocument = {
      semanticTokens = vim.NIL,
    },
    workspace = {
      semanticTokens = vim.NIL,
    }
  },
}
