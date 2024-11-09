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
  {
    'folke/neodev.nvim'
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  { 'bluz71/vim-moonfly-colors',                  name = 'moonfly' },
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
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
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
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'm4xshen/autoclose.nvim' },
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
  { 'HiPhish/rainbow-delimiters.nvim' },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
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
require('autoclose').setup()
require('neodev').setup({
  library = { plugins = { 'nvim-dap-ui' }, types = true },
})

require('plugins.cmp-nvim')
require('plugins.dap')
require('plugins.gitsigns')
require('plugins.languages')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.telescope')
