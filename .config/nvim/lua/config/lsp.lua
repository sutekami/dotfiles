-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- LSP を有効化
vim.lsp.enable({
  "vtsls",
  "vue_ls",
  "dartls",
})

-- Diagnostic 表示設定（これは今まで通り）
vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = true,
  severity_sort = true,
})

