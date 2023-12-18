return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-cmdline",
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local lspkind = require("lspkind")
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
				completeopt = "menu,menuone,select",
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
				["<C-j>"] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Select,
					cmp.SelectBehavior.Preview,
				}), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Select,
					cmp.SelectBehavior.Preview,
				}), -- previous suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "codeium" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			}),
			formatting = {
				format = function(_, vim_item)
					vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
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
