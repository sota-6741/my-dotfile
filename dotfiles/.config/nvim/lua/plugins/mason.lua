return {
  -- Mason 本体 (リポジトリ名を mason-org に更新)
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },
  -- Mason LSPConfig (リポジトリ名を mason-org に更新)
  -- 注意: gopls などの LSP サーバーは lsp.lua の servers で管理されているため、
  -- ここでの ensure_installed は冗長ですが、明示的に残す場合は mason-org を使用します。
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "gopls" },
    },
  },
}
