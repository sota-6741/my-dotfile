return {
  "saghen/blink.cmp",
  -- タイムアウトを防ぐため build を一時的にコメントアウト
  -- build = "cargo build --release",
  opts = {
    keymap = {
      ["<CR>"] = { "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
