return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- fuente para el texto en el buffer
    "hrsh7th/cmp-path", -- fuente para rutas del sistema de archivos
    "L3MON4D3/LuaSnip", -- motor de snippets
    "saadparwaiz1/cmp_luasnip", -- para autocompletado
    "rafamadriz/friendly-snippets", -- snippets útiles
    "onsails/lspkind.nvim", -- pictogramas estilo vs-code
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-emoji",
  },

  config = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    -- local default = require("cmp.config.default")
    local luasnip = require("luasnip")
    -- local lspkind = require("lspkind")
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

    -- Carga snippets en el estilo de VSCode desde los plugins instalados (por ejemplo, friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Configura nvim-cmp
    vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#002c38", fg = "White", italic = true })
    vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#002c38", fg = "White", italic = true, bold = true })
    --
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "NONE", fg = "#94a0a1" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#788b05" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#b48900" })

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
    --
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#000000", italic = true })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview",
      },
      window = {
        completion = cmp.config.window.bordered({
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          side_padding = 0,
          side = "double",
          offset_x = 1, -- Ajusta el desplazamiento horizontal del borde
          offset_y = 0, -- Ajusta el desplazamiento vertical del borde
          winhighlight = "Normal:MyPmenu,FloatBorder:MyPmenu,CursorLine:MyCursorLine,Search:Error",
          col_offset = 0,
        }),
        documentation = {
          border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpDoc",
        },
      },
      snippet = { -- Configura cómo nvim-cmp interactúa con el motor de snippets
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- sugerencia anterior
        ["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- siguiente sugerencia
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- mostrar sugerencias de autocompletado
        ["<C-e>"] = cmp.mapping.abort(), -- cerrar la ventana de autocompletado
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
      -- Fuentes para el autocompletado
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "emoji" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- texto dentro del buffer actual
        { name = "path" }, -- rutas del sistema de archivos
        { name = "nvim_lsp_signature_help" },
        { name = "cmp_cmdline" },
      }),
      sorting = {
        comparators = {
          compare.exact,
          compare.recenty_used,
        },
      },
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      }),

      -- Configura lspkind para pictogramas estilo vs-code en el menú de autocompletado
      -- formatting = {
      --   format = function(_, vim_item)
      --     vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
      --     return vim_item
      --   end,
      -- },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = (icons[vim_item.kind] or "Foo") .. vim_item.kind
          vim_item.menu = icons[entry.source.name]
          -- local kind = vim_item.kind
          -- vim_item.kind = (cmp_kinds[kind] or "?")
          -- vim_item.menu = " (" .. kind .. ") "
          --
          vim_item.abbr = vim_item.abbr:match("[^(]+")

          return vim_item
        end,
      },
    })
  end,
}
