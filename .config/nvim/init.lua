require("config.lazy")
require("config.barbar")
require("config.lsp")
require("config.persistence-session")

local opt = vim.opt

-- 行数の表示
opt.number = true

-- 全角文字表示設定
opt.ambiwidth = 'double'

-- タブ → スペース
opt.expandtab = true

-- タブ一文字の表示幅
opt.tabstop = 2

-- インデント幅
opt.shiftwidth = 2

-- タブキーで入力するスペース数（-1で tabstop と同じになる）
opt.softtabstop = -1

-- テキストをヤンクしたときにクリップボートにバインドするように
opt.clipboard:append({ "unnamed", "unnamedplus" })

-- 最終行に改行を入れる
vim.opt.endofline = true
vim.opt.fixendofline = true

--折り返ししない
opt.wrap = false

-- スペルチェッカーを有効（日本語や中国語などのアジア言語は無視する）
opt.spell = true
opt.spelllang = { 'en_us', 'cjk' }

-- 全選択
vim.keymap.set({ "n", "v" }, "vie", "ggVG", {
  noremap = true,
  silent = true,
  desc = "Select All",
})

