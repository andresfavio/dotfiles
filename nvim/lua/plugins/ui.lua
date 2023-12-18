return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		enabled = true,
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
			-- table.insert(opts.routes, 1, {
			-- 	filter = {
			-- 		cond = function()
			-- 			return not focused
			-- 		end,
			-- 	},
			-- 	view = "notify_send",
			-- 	opts = { stop = false },
			-- })

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

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				-- globalstatus = false,
				theme = "onedark",
			},
		},
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>ue",
				function()
					require("edgy").toggle()
				end,
				desc = "Edgy Toggle",
			},
    -- stylua: ignore
    { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
		},
		opts = function()
			local opts = {
				bottom = {
					{
						ft = "toggleterm",
						size = { height = 0.4 },
						filter = function(buf, win)
							return vim.api.nvim_win_get_config(win).relative == ""
						end,
					},
					{
						ft = "noice",
						size = { height = 0.4 },
						filter = function(buf, win)
							return vim.api.nvim_win_get_config(win).relative == ""
						end,
					},
					{
						ft = "lazyterm",
						title = "LazyTerm",
						size = { height = 0.4 },
						filter = function(buf)
							return not vim.b[buf].lazyterm_cmd
						end,
					},
					"Trouble",
					{
						ft = "trouble",
						filter = function(buf, win)
							return vim.api.nvim_win_get_config(win).relative == ""
						end,
					},
					{ ft = "qf", title = "QuickFix" },
					{
						ft = "help",
						size = { height = 20 },
						-- don't open help files in edgy that we're editing
						filter = function(buf)
							return vim.bo[buf].buftype == "help"
						end,
					},
					{ title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
					{ title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
				},
				keys = {
					-- increase width
					["<c-Right>"] = function(win)
						win:resize("width", 2)
					end,
					-- decrease width
					["<c-Left>"] = function(win)
						win:resize("width", -2)
					end,
					-- increase height
					["<c-Up>"] = function(win)
						win:resize("height", 2)
					end,
					-- decrease height
					["<c-Down>"] = function(win)
						win:resize("height", -2)
					end,
				},
			}
			return opts
		end,
	},
	{
		"declancm/cinnamon.nvim",
		event = "VeryLazy",
		config = function()
			require("cinnamon").setup({
				extra_keymaps = true,
				extended_keymaps = true,
				override_keymaps = true,
				always_scroll = true,
				max_length = 500,
				scroll_limit = -1,
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			require("rainbow-delimiters.setup")({
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					commonlisp = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					latex = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
				blacklist = { "c", "cpp" },
			})
		end,
	},
	{
		"gen740/SmoothCursor.nvim",
		event = "VeryLazy",
		config = function()
			require("smoothcursor").setup({
				type = "exp",
				fancy = {
					enable = false, -- enable fancy mode
					head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
					body = {
						-- { cursor = "󰝥", texthl = "SmoothCursorAqua" },
						-- { cursor = "󰝥", texthl = "SmoothCursorAqua" },
						{ cursor = "●", texthl = "SmoothCursorAqua" },
						{ cursor = "●", texthl = "SmoothCursorAqua" },
						{ cursor = "•", texthl = "SmoothCursorAqua" },
						{ cursor = ".", texthl = "SmoothCursorAqua" },
						{ cursor = ".", texthl = "SmoothCursorAqua" },
					},
					tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
				},
			})
		end,
	},

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

			logo = string.rep("\n", 6) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
}
