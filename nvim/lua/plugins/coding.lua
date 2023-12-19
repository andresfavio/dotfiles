return {
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local defaults = require("cmp.config.default")()
			local cmp_kinds = {
				Text = "   ",
				Method = "   ",
				Function = "   ",
				Constructor = "   ",
				Field = "   ",
				Variable = "   ",
				Class = "   ",
				Interface = "   ",
				Module = "   ",
				Property = "   ",
				Unit = "   ",
				Value = "   ",
				Enum = "   ",
				Keyword = "   ",
				Snippet = "   ",
				Color = "   ",
				File = "   ",
				Reference = "   ",
				Folder = "   ",
				EnumMember = "   ",
				Constant = "   ",
				Struct = "   ",
				Event = "   ",
				Operator = "   ",
				TypeParameter = "   ",
				Codeium = "   ",
			}

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
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
					{ name = "path" },
					{ name = "codeium" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("lazyvim.config").icons.kinds
						if cmp_kinds[item.kind] then
							item.kind = cmp_kinds[item.kind] .. item.kind
						end
						return item
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
	},
	{
		{
			"nvim-treesitter/nvim-treesitter",
			event = { "BufReadPre", "BufNewFile" },
			build = ":TSUpdate",
			dependencies = {
				"nvim-treesitter/nvim-treesitter-textobjects",
				"windwp/nvim-ts-autotag",
			},
			config = function()
				-- import nvim-treesitter plugin
				local treesitter = require("nvim-treesitter.configs")

				-- configure treesitter
				treesitter.setup({ -- enable syntax highlighting
					highlight = {
						enable = true,
					},
					-- enable indentation
					indent = { enable = true },
					-- enable autotagging (w/ nvim-ts-autotag plugin)
					autotag = {
						enable = true,
					},
					-- ensure these language parsers are installed
					ensure_installed = {
						"json",
						"javascript",
						"typescript",
						"tsx",
						"yaml",
						"html",
						"css",
						"prisma",
						"markdown",
						"markdown_inline",
						"svelte",
						"graphql",
						"bash",
						"lua",
						"vim",
						"dockerfile",
						"gitignore",
						"query",
					},
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = "<C-space>",
							node_incremental = "<C-space>",
							scope_incremental = false,
							node_decremental = "<bs>",
						},
					},
				})

				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				require("ts_context_commentstring").setup({})
			end,
		},
	},
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			-- import nvim-autopairs
			local autopairs = require("nvim-autopairs")

			-- configure autopairs
			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})

			-- import nvim-autopairs completion functionality
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- import nvim-cmp plugin (completions plugin)
			local cmp = require("cmp")

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
