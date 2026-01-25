---@type vim.lsp.Config
return {
	cmd = { "kotlin-lsp", "--stdio" },
	filetypes = { "kotlin" },
	root_markers = { "gradle.properties", "build.gradle.kts", ".git" },
}
