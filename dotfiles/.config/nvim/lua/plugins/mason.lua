return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "eslint-lsp",
        "prettier",
        -- typescript-tools が必要とする tsserver を提供するパッケージ
        "typescript-language-server", 
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    -- LazyVim側と重複してインストールが走るのを防ぐため、最低限に
    opts = {
      ensure_installed = { "gopls" },
    },
  },
}
