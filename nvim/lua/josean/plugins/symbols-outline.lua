return {
  "simrat39/symbols-outline.nvim",

  config = function()
    local symbols = require("symbols-outline")
    symbols.setup({
      keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
      cmd = "SymbolsOutline",
      opts = {
        position = "right",
      },
    })
  end,
}
