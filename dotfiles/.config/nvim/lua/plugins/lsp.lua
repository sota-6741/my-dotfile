return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
      },
      -- 診断 (Diagnostics) の設定
      diagnostics = {
        virtual_text = true,
        float = {
          border = "rounded",
          source = "always",
        },
      },
    },
  },
}
