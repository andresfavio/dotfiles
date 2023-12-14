return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
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
