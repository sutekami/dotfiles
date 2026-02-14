-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md


-- Vue の LSP 設定
local vue_language_server_path = '/Users/mashu_giga/Library/pnpm/global/5/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}
local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}
local vue_ls_config = {}
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)

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

