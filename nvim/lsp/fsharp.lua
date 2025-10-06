---@type vim.lsp.Config
return {
  cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
  filetypes = { "fsharp" },
  root_markers = { "*.sln", "*.fsproj", ".git" },
  init_options = {
    AutomaticWorkspaceInit = true
  },
  settings = {
    FSharp = {
      keywordsAutocomplete = true,
      ExternalAutocomplete = false,
      Linter = true,
      UnionCaseStubGeneration = true,
      UnionCaseStubGenerationBody = "failwith 'Not Implemented'",
      RecordStubGeneration = true,
      RecordStubGenerationBody = "failwith 'Not Implemented'",
      InterfaceStubGeneration = true,
      InterfaceStubGenerationObjectIdentifier = "this",
      InterfaceStubGenerationMethodBody = "failwith 'Not Implemented'",
      UnusedOpensAnalyzer = true,
      UnusedDeclarationsAnalyzer = true,
      UseSdkScripts = true,
      SimplifyNameAnalyzer = true,
      ResolveNamespaces = true,
      EnableReferenceCodeLens = true,
    },
  },
}
