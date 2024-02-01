local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.vnim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
  ]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'joshdick/onedark.vim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'simrat39/rust-tools.nvim'
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'junegunn/fzf.vim'
  use { 'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'akinsho/flutter-tools.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'thosakwe/vim-flutter'
  use 'dart-lang/dart-vim-plugin'
  use { 'iron-e/rust.vim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'nvim-lua/plenary.nvim' } }
  use 'dispersia/lsp-status.nvim'
  use { 'dispersia/galaxyline.nvim', requires = { 'smiteshp/nvim-gps', 'kyazdani42/nvim-web-devicons' } }
  use 'ryanoasis/vim-devicons'
  use 'mhinz/vim-crates'
  use 'iamcco/markdown-preview.nvim'
end)

require('lsp-status').register_progress()

require('plugins.cmp-nvim')
require('plugins.galaxyline')
require('plugins.gitsigns')
require('plugins.languages')
require('plugins.nvim-treesitter')
require('plugins.telescope')

