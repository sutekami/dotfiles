local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- normalモードで :BufferNext コマンドを実行するマッピング
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
