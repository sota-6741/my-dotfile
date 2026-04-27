return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
        -- typescript-tools を使うため、他のTS関連LSPが絶対に起動しないようにする
        vtsls = { enabled = false, autostart = false },
        tsserver = { enabled = false, autostart = false },
      },
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
