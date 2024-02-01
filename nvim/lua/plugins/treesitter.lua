require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
    },
    ensure_installed = { "rust", "kotlin", "c_sharp", "javascript", "lua" },
    indent = { enable = true },
    sync_install = false,
  }
  