return {
  "folke/snacks.nvim",
  opts = {
    -- 1. Explorer の意図しない自動起動を防ぎ、本来のファイラーの挙動を守る
    explorer = {
      git_ignore = false,
      hidden = true,
    },

    -- 2. Snacks Explorer を使う際の操作性を最適化する
    picker = {
      sources = {
        explorer = {
          -- 起動時に検索窓ではなく、最初からツリー側(list)にフォーカスを当てる
          focus = "list",
          hidden = true,
          ignored = true,
        },
      },
      win = {
        input = {
          keys = {
            -- 検索窓で Esc を押した際、すぐにツリー側へ戻れるようにする
            ["<Esc>"] = { "toggle_focus", mode = { "i", "n" } },
          },
        },
      },
      -- global picker settings
      hidden = true,
      ignored = true,
    },
  },
}
