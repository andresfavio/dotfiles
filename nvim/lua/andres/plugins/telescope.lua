return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    -- "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    telescope.setup({

      keys = {
        {
          "<leader>fP",
          function()
            require("telescope.builtin").find_files({
              cwd = require("lazy.core.config").options.root,
            })
          end,
          desc = "Find Plugin File",
        },
        {
          ";f",
          function()
            local builtin = require("telescope.builtin")
            builtin.find_files({
              no_ignore = false,
              hidden = true,
            })
          end,
          desc = "Lists files in your current working directory, respects .gitignore",
        },
        {
          ";r",
          function()
            local builtin = require("telescope.builtin")
            builtin.live_grep()
          end,
          desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
        },
        {
          "\\\\",
          function()
            local builtin = require("telescope.builtin")
            builtin.buffers()
          end,
          desc = "Lists open buffers",
        },
        {
          ";t",
          function()
            local builtin = require("telescope.builtin")
            builtin.help_tags()
          end,
          desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
        },
        {
          ";;",
          function()
            local builtin = require("telescope.builtin")
            builtin.resume()
          end,
          desc = "Resume the previous telescope picker",
        },
        {
          ";e",
          function()
            local builtin = require("telescope.builtin")
            builtin.diagnostics()
          end,
          desc = "Lists Diagnostics for all open buffers or a specific buffer",
        },
        {
          ";s",
          function()
            local builtin = require("telescope.builtin")
            builtin.treesitter()
          end,
          desc = "Lists Function names, variables, from Treesitter",
        },
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          -- n = { ["q"] = require("telescope.actions").close },
          i = { ["<c-t>"] = trouble.open_with_trouble },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
      },

      extensions_list = { "themes", "terms", "fzf" },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>sd", "<cmd>Telescope file_browser<CR>", { desc = "Busqueda de archvos" })
    keymap.set(
      "n",
      "<leader>sb",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { desc = "Busqueda de archivos acutales" }
    )
  end,
}
