vim.o.expandtab=true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.softtabstop=2

vim.cmd [[colorscheme moonfly]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.inccommand = 'nosplit'
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.breakindent = true
vim.opt.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.opt.termguicolors = true
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.g.autochdir = true

vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false


vim.api.nvim_exec(
    [[
    augroup AutoLSP
      autocmd!
      autocmd CursorHold * lua vim.diagnostic.open_float({ focusable = false })
    augroup end
    ]],
    false
)
