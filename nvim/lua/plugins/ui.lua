return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
    -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { fg = "#1c716a" }),
    -- vim.api.nvim_set_hl(0, "NoiceCmdlineIconCmdline", { fg = "#849900" }),
    -- vim.api.nvim_set_hl(0, "NoiceMini", { fg = "#93a1a1", bg = "#07171a" }),
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "NotifyBackground",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      render = "wrapped-compact",
      stages = "slide",
      timeout = 700,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      top_down = true,
    },
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  -- {
  --   "b0o/incline.nvim",
  --   dependencies = { "craftzdog/solarized-osaka.nvim" },
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     -- local colors = require("solarized-osaka.colors").setup()
  --     require("incline").setup({
  --       highlight = {
  --         groups = {
  --           InclineNormal = { guibg = "#002c38", guifg = "#9eabac" },
  --           InclineNormalNC = { guifg = "#9eabac", guibg = "#001013" },
  --         },
  --       },
  --       window = { margin = { vertical = 0, horizontal = 0 } },
  --       hide = {
  --         cursorline = true,
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         if vim.bo[props.buf].modified then
  --           filename = "[+] " .. filename
  --         end
  --
  --         local icon, color = require("nvim-web-devicons").get_icon_color(filename)
  --         return { { icon, guifg = color }, { " " }, { filename } }
  --       end,
  --     })
  --   end,
  -- },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        lspsaga = true,
        gitsigns = false,
        tmux = true,
        kitty = { enabled = false },
      },
      window = {
        width = 1,
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  -- Lua
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
   █████╗ ███╗   ██╗██████╗ ██████╗ ███████╗███████╗
  ██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔════╝██╔════╝
  ███████║██╔██╗ ██║██║  ██║██████╔╝█████╗  ███████╗
  ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██╔══╝  ╚════██║
  ██║  ██║██║ ╚████║██████╔╝██║  ██║███████╗███████║
  ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
       ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
