require("config.lazy")
require("config.barbar")
require("config.lsp")
require("config.persistence-session")
require("config.tree")

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

-- 検索においてハイライトを無効にする
opt.hlsearch = false

-- スペルチェッカーを有効（日本語や中国語などのアジア言語は無視する）
opt.spell = true
opt.spelllang = { 'en_us', 'cjk' }
opt.spelloptions:append("camel")

-- 全選択
vim.keymap.set({ "n", "v" }, "vie", "ggVG", {
  noremap = true,
  silent = true,
  desc = "Select All",
})

vim.keymap.set('i', '<C-c>', '<Esc>', {
  noremap = true,
  silent = true,
  desc = "Exit insert mode",
})

-- =========================
-- 外部変更（git switch 等）を即同期させる設定
-- =========================

-- 外部で変更されたファイルを自動で読み直す
vim.o.autoread = true

-- CursorHold の発火頻度を上げて変更検知を高速化
vim.o.updatetime = 200

-- 外部変更チェック
vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
  "CursorHoldI",
  "TermLeave", -- ← toggleterm から戻った瞬間
}, {
  pattern = "*",
  callback = function()
    -- special buffer を除外
    if vim.bo.buftype == "" then
      vim.cmd("checktime")
    end
  end,
})
