return {
  "gen740/SmoothCursor.nvim",
  event = "VeryLazy",
  config = function()
    require("smoothcursor").setup({
      type = "exp",
      fancy = {
        enable = true, -- enable fancy mode
        head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
        body = {
          -- { cursor = "󰝥", texthl = "SmoothCursorAqua" },
          -- { cursor = "󰝥", texthl = "SmoothCursorAqua" },
          { cursor = "●", texthl = "SmoothCursorAqua" },
          { cursor = "●", texthl = "SmoothCursorAqua" },
          { cursor = "•", texthl = "SmoothCursorAqua" },
          { cursor = ".", texthl = "SmoothCursorAqua" },
          { cursor = ".", texthl = "SmoothCursorAqua" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
      },
    })
  end,
}
