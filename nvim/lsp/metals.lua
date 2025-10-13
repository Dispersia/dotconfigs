local opts = table.concat({
  "-Xmx12G",
  "-Xss4m",
  "-XX:+UseG1GC",
  "-XX:+UseStringDeduplication",
  "-XX:+UseNUMA",
  "-XX:+ParallelRefProcEnabled",
  "-XX:+AlwaysPreTouch"
}, " ")

---@type vim.lsp.Config
return {
  cmd = { "metals" },
  cmd_env = {
    JAVA_TOOL_OPTIONS = opts,
    COURSIER_JAVA_OPTS = opts
  },
  filetypes = { "scala", "sbt", "java" },
  root_markers = { "build.mill", "build.sbt", "build.sc", ".git" },
}
