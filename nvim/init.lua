local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'rebelot/kanagawa.nvim' },
  {
    'folke/zen-mode.nvim',
    opts = {}
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {}
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      }
    }
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>-',
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file'
      },
      {
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = 'Open the file manager in nvims working',
      },
    },
    opts = {
      open_for_directories = true
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "rot", "rust", "toml" })
    end
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'neovim/nvim-lspconfig' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'luckasRanarison/tailwind-tools.nvim',
      'onsails/lspkind-nvim'
    },
    opts = function()
      return {
        formatting = {
          format = require('lspkind').cmp_format({
            before = require('tailwind-tools.cmp').lspkind_format
          })
        }
      }
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'luckasRanarison/tailwind-tools.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {}
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'dispersia/lsp-status.nvim'
    }
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 50
    end,
    opts = {
    }
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    submodules = false
  },
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (trouble)'
      }
    }
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    }
  },
  { 'williamboman/mason.nvim' },
  { 'mfussenegger/nvim-lint' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lsp/plenary.nvim'
    }
  },
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    }
  },
  {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  { 'CraneStation/cranelift.vim' },
  { 'slint-ui/vim-slint' }
})

require('config')

require('mason').setup()
require('mason-lspconfig').setup()
require('lsp-status').register_progress()

local rainbow_delimiters = require('rainbow-delimiters')
require('rainbow-delimiters.setup').setup({
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  priority = {
    [''] = 110,
    lua = 210,
  },
  highlight = {
    'RainbowDelimiterCyan',
    'RainbowDelimiterGreen',
    'RainbowDelimiterBlue',
    'RainbowDelimiterViolet',
    'RainbowDelimiterYellow',
    'RainbowDelimiterOrange',
    'RainbowDelimiterRed'
  }
})

require('plugins.cmp-nvim')
require('plugins.dap')
require('plugins.gitsigns')
require('plugins.languages')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.telescope')
