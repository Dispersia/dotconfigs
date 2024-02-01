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
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    { 'joshdick/onedark.vim' },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'neovim/nvim-lspconfig' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'nvim-tree/nvim-tree.lua' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'glepnir/galaxyline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'dispersia/lsp-status.nvim'
        }
    }
})

require('config')

require('lsp-status').register_progress()

require('plugins.cmp-nvim')
require('plugins.galaxyline')
require('plugins.gitsigns')
require('plugins.languages')
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.telescope')
