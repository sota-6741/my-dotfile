-- =========================================================
-- 診断 (Diagnostics / エラー表示) 関連のキーマップ
-- =========================================================

-- カーソル位置のエラー詳細をフローティングウィンドウで表示
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics (Float)" })

-- 前のエラー/警告へジャンプ
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic" })

-- 次のエラー/警告へジャンプ
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic" })
