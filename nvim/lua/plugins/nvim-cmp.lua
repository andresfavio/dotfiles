return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    {
      "Exafunction/codeium.nvim",
      cmd = "Codeium",
      build = ":Codeium Auth",
      opts = {},
    },
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local icons = {
      Text = " ",
      Method = " ",
      Function = " ",
      Constructor = " ",
      Field = " ",
      Variable = " ",
      Class = " ",
      Interface = " ",
      Module = " ",
      Property = " ",
      Unit = " ",
      Value = " ",
      Enum = " ",
      Keyword = " ",
      Snippet = " ",
      Color = "  ",
      File = " ",
      Reference = " ",
      Folder = " ",
      EnumMember = " ",
      Constant = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",

      nvim_lsp = "",
      buffer = "",
      luasnip = "",
      codeium = " ",
    }
    local function border(hl_name)
      return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
      }
    end
    -- Configura nvim-cmp
    vim.api.nvim_set_hl(0, "MyPmenu", { bg = "#0f141c", fg = "#8991ad" })
    vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#2c354e", fg = "#8ea5c3" })
    vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#2c354e", fg = "White", italic = true, bold = true })

    -- -- gray
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
    --
    -- -- blue
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
    --
    -- -- light blue
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
    --
    -- -- pink
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
    --
    -- -- front
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

    vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#0f141c" })
    -- vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#0f141c", fg = "#0f141c", italic = true })
    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        completion = cmp.config.window.bordered({
          -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          border = "none",
          side_padding = 1,
          side = "double",
          offset_x = 1, -- Ajusta el desplazamiento horizontal del borde
          offset_y = 0, -- Ajusta el desplazamiento vertical del borde
          winhighlight = "Normal:MyPmenu,FloatBorder:MyPmenu,CursorLine:MyCursorLine,Search:Error",
          col_offset = 0,
        }),
        documentation = {
          -- border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpDoc",
        },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "codeium" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = (icons[vim_item.kind] or "") .. vim_item.kind
          vim_item.menu = icons[entry.source.name]
          vim_item.abbr = vim_item.abbr:match("[^(]+")

          return vim_item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require("cmp").setup(opts)
  end,
}
