-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.opt

-- タブ → スペース
opt.expandtab = true

-- タブ一文字の表示幅
opt.tabstop = 2

-- インデント幅
opt.shiftwidth = 2

-- タブキーで入力するスペース数（-1で tabstop と同じになる）
opt.softtabstop = -1

-- スペルチェッカーを有効（日本語や中国語などのアジア言語は無視する）
opt.spell = true
opt.spelllang = { "en_us", "cjk" }

vim.keymap.set({ "n", "v" }, "vie", "ggVG", {
  noremap = true,
  silent = true,
  desc = "Exit insert mode",
})

-- 末尾の空白を取り除く
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
