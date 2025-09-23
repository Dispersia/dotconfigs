local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Space>gb', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Space>go', function() dapui.open() end)
vim.keymap.set('n', '<Space>gc', function() dapui.close() end)
