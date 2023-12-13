-- -- lazy.nvim
-- return {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--
--   opts = {
--     skip = true,
--   },
--   dependencies = {
--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--     "MunifTanjim/nui.nvim",
--     -- OPTIONAL:
--     --   `nvim-notify` is only needed, if you want to use the notification view.
--     --   If not available, we use `mini` as the fallback
--     "rcarriga/nvim-notify",
--   },
--   config = function()
--     local noice = require("noice")
--     noice.setup({
--       presets = {
--         inc_rename = true,
--         bottom_search = false, -- use a classic bottom cmdline for search
--         command_palette = false, -- position the cmdline and popupmenu together
--         long_message_to_split = false, -- long messages will be sent to a split
--         lsp_doc_border = true, -- add a border to hover docs and signature help
--       },
--       routes = {
--         filter = {
--           event = "msg_show",
--           kind = "",
--           find = "written",
--         },
--       },
--       lsp = {
--         progress = {
--           enabled = true,
--           -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
--           -- See the section on formatting for more details on how to customize.
--           --- @type NoiceFormat|string
--           format = "lsp_progress",
--           --- @type NoiceFormat|string
--           format_done = "lsp_progress_done",
--           throttle = 1000 / 30, -- frequency to update lsp progress message
--           view = "mini",
--         },
--       },
--       hover = {
--         enabled = true,
--         silent = false, -- set to true to not show a message if hover is not available
--         view = nil, -- when nil, use defaults from documentation
--         ---@type NoiceViewOptions
--         opts = {}, -- merged with defaults from documentation
--       },
--       views = {
--         cmdline_popup = {
--           position = {
--             row = 5,
--             col = "50%",
--           },
--           size = {
--             width = 60,
--             height = "auto",
--           },
--         },
--         popupmenu = {
--           relative = "editor",
--           position = {
--             row = 8,
--             col = "50%",
--           },
--           size = {
--             width = 60,
--             height = 10,
--           },
--           border = {
--             style = "rounded",
--             padding = { 0, 1 },
--           },
--           win_options = {
--             winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
--           },
--         },
--       },
--       opts = function(_, opts)
--         table.insert(opts.routes, {
--           filter = {
--             event = "notify",
--             find = "No information available",
--           },
--           opts = { skip = true },
--         })
--         local focused = true
--         vim.api.nvim_create_autocmd("FocusGained", {
--           callback = function()
--             focused = true
--           end,
--         })
--         vim.api.nvim_create_autocmd("FocusLost", {
--           callback = function()
--             focused = false
--           end,
--         })
--         table.insert(opts.routes, 1, {
--           filter = {
--             cond = function()
--               return not focused
--             end,
--           },
--           view = "notify_send",
--           opts = { stop = false },
--         })
--
--         opts.commands = {
--           all = {
--             -- options for the message history that you get with `:Noice`
--             view = "split",
--             opts = { enter = true, format = "details" },
--             filter = {},
--           },
--         }
--
--         vim.api.nvim_create_autocmd("FileType", {
--           pattern = "markdown",
--           callback = function(event)
--             vim.schedule(function()
--               require("noice.text.markdown").keys(event.buf)
--             end)
--           end,
--         })
--
--         -- opts.presets.lsp_doc_border = true
--       end,
--     })
--   end,
-- }
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
  },
  -- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  },
}
