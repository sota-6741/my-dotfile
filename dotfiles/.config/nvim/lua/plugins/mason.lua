return {
  -- Mason 本体の設定 (リポジトリ名を mason-org に更新)
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },
  -- LSP サーバーの設定 (リポジトリ名を mason-org に更新)
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "gopls" },
    },
  },
}
