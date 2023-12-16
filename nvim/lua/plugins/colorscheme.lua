return {
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Lualine options --
      lualine = {
        transparent = true, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {
        -- Normal = { bg = "#040607" },
        CursorLine = { bg = "#06080b" },
        Pmenu = { bg = "#111720" },
        -- LspReferenceText = { "#111720" },
        -- PmenuSbar = { bg = "#111720" },
        CmpItemMenu = { bg = "#111720" },
        FloatBorder = { fg = "#9bafc0", bg = "NONE" },
        TelescopeBorder = { bg = "NONE", fg = "#9bafc0" },
        TelescopePromptBorder = { fg = "#9bafc0" },
        TelescopeResultsBorder = { fg = "#9bafc0" },
        TelescopePreviewBorder = { fg = "#9bafc0" },
        TelescopeSelection = { bg = "#0a1016" },
        TelescopeSelectionCaret = { fg = "#ee3022" },
        NormalFloat = { bg = "NONE", fg = "#a57705" },
      }, -- Override highlight groups
      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
  -- {
  --   "xiyaowong/transparent.nvim",
  -- },
}
