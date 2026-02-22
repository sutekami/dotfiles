return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup()

    -- 次の変更へ
    vim.keymap.set('n', ']c', function()
      gitsigns.next_hunk()
    end, { desc = 'Next Git Hunk' })

    -- 前の変更へ
    vim.keymap.set('n', '[c', function()
      gitsigns.prev_hunk()
    end, { desc = 'Prev Git Hunk' })

    -- 変更のプレビュー（めちゃ便利）
    vim.keymap.set('n', '<leader>hp', function()
      gitsigns.preview_hunk()
    end, { desc = 'Preview Hunk' })

    -- 変更一覧を quickfix に
    vim.keymap.set('n', '<leader>hq', function()
      gitsigns.setqflist()
    end, { desc = 'Hunks to Quickfix' })
  end
}
