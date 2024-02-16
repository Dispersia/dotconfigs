metals_config = require('metals').bare_config()
local lsp_settings = require('plugins.languages.settings')

metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.capabilities = lsp_settings.Capabilities
metals_config.on_attach = lsp_settings.on_attach(client, bufnr)
metals_config.init_options.statusBarProvider = "on"

vim.api.nvim_exec(
  [[
  augroup MetalsInitialize
    autocmd!
    autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)
  augroup end
  ]],
  false
)

