return {
  -- LSPと診断 (Diagnostics) の設定
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason のセットアップ (LSPサーバーの自動インストール)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls" },
      })

      -- gopls (GoのLanguage Server) の有効化と設定
      require("lspconfig").gopls.setup({
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      -- =========================================================
      -- エラー表示（Diagnostics）のカスタマイズ
      -- =========================================================

      -- 1. フローティングウィンドウの見た目を設定
      vim.diagnostic.config({
        virtual_text = true, -- 右端の途切れるテキストが邪魔なら false に変更
        float = {
          border = "rounded", -- 枠線を角丸にする
          sokrce = "always", -- エラーの発生元 (staticcheck等) を表示
          header = "", -- 余計なヘッダーを消す
          prefix = "", -- 余計なプレフィックスを消す
          focusable = true,
        },
      })

      -- 2. カーソルを止めてから自動処理が走るまでの待機時間（300ミリ秒）
      vim.opt.updatetime = 300

      -- 3. カーソルを合わせた時 (CursorHold) に自動でポップアップを表示
      vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
          -- focus = false で、ポップアップにカーソルが奪われるのを防ぐ
          vim.diagnostic.open_float(nil, { focus = false })
        end,
      })
    end,
  },
}
