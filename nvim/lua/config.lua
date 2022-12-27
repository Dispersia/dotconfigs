vim.o.inccommand = 'nosplit'
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.breakindent = true
vim.opt.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.termguicolors = true
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.o.expandtab=true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.softtabstop=2

vim.g.onedark_terminal_italics = 2

vim.g.autochdir = true

vim.g.python3_host_prog = '/home/dispersia/miniconda3/envs/directml/bin/python'
vim.g.python_host_prog = '/home/dispersia/miniconda3/envs/directml/bin/python'

vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.cmd [[colorscheme onedark]]

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
vim.api.nvim_exec(
  [[
  augroup AutoLSP
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float({ focusable = false })
  augroup end
  ]],
  false
)
vim.api.nvim_exec(
  [[
  augroup AutoSaveOnInsertLeave
    autocmd InsertLeave * update
  augroup end
  ]],
  false
)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

