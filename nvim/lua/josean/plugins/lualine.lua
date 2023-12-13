return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      -- blue = "#218cd3",
      -- green = "#869a00",
      -- violet = "#d43383",
      -- yellow = "#b48900",
      -- red = "#dd2e2b",
      -- fg = "#c3ccdc",
      -- bg = "#001013",
      -- inactive_bg = "#2c3043",

      ----
      base03 = "#002b36",
      base02 = "#001013",
      base01 = "#586e75",
      base00 = "#657b83",
      base0 = "#839496",
      base1 = "#93a1a1",
      base2 = "#eee8d5",
      base3 = "#fdf6e3",
      yellow = "#b58900",
      orange = "#cb4b16",
      red = "#dc322f",
      magenta = "#d33682",
      violet = "#6c71c4",
      blue = "#005f87",
      cyan = "#2aa198",
      green = "#859900",
    }
    local my_lualine_theme = {
      normal = {
        a = { fg = colors.base02, bg = colors.blue, gui = "bold" },
        b = { fg = colors.base02, bg = colors.base1, gui = "bold" },
        c = { fg = colors.base1, bg = colors.base02 },
      },
      insert = { a = { fg = colors.base02, bg = colors.green, gui = "bold" } },
      visual = { a = { fg = colors.base02, bg = colors.magenta, gui = "bold" } },
      replace = { a = { fg = colors.base02, bg = colors.red, gui = "bold" } },
      inactive = {
        a = { fg = colors.base0, bg = colors.base02, gui = "bold" },
        b = { fg = colors.base03, bg = colors.base00 },
        c = { fg = colors.base01, bg = colors.base02 },
      },

      -- normal = {
      --   a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
      --   b = { bg = colors.bg, fg = colors.fg },
      --   c = { bg = colors.bg, fg = colors.fg },
      -- },
      -- insert = {
      --   a = { bg = colors.green, fg = colors.bg, gui = "bold" },
      --   b = { bg = colors.bg, fg = colors.fg },
      --   c = { bg = colors.bg, fg = colors.fg },
      -- },
      -- visual = {
      --   a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
      --   b = { bg = colors.bg, fg = colors.fg },
      --   c = { bg = colors.bg, fg = colors.fg },
      -- },
      -- command = {
      --   a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
      --   b = { bg = colors.bg, fg = colors.fg },
      --   c = { bg = colors.bg, fg = colors.fg },
      -- },
      -- replace = {
      --   a = { bg = colors.red, fg = colors.bg, gui = "bold" },
      --   b = { bg = colors.bg, fg = colors.fg },
      --   c = { bg = colors.bg, fg = colors.fg },
      -- },
      -- inactive = {
      --   a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
      --   b = { bg = colors.inactive_bg, fg = colors.semilightgray },
      --   c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      -- },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}

-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   opts = {
--     options = {
--       theme = "solarized_dark",
--     },
--   },
-- }
