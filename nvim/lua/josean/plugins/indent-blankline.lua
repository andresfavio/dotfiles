-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   main = "ibl",
--   opts = {},
--   config = function()
--     local blankline = require("ibl")
--     blankline.setup({})
--   end,
-- }
return {
  "lukas-reineke/indent-blankline.nvim",
  -- event = "LazyFile",
  opts = {},
  main = "ibl",
  config = function()
    -- local highlight = {
    --   "RainbowRed",
    --   "RainbowYellow",
    --   "RainbowBlue",
    --   "RainbowOrange",
    --   "RainbowGreen",
    --   "RainbowViolet",
    --   "RainbowCyan",
    -- }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.ACTIVE, function(bufnr)
      return vim.api.nvim_buf_line_count(bufnr) < 5000
    end)
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    -- end)

    -- vim.g.rainbow_delimiters = { highlight = highlight }
    local ibl = require("ibl")
    ibl.setup({
      indent = {
        char = "▏",
        tab_char = { "a", "b", "c" },
        -- highlight = { "Function", "Label" },
        smart_indent_cap = true,
        priority = 1,
      },

      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label" },
        priority = 500,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })
  end,
}
