local discipline = require("andres.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- modo normal
keymap.set("i", "jk", "<ESC>", opts)
-- Delete a word backwards
--
keymap.set("n", ".", ":")
keymap.set("n", "dw", 'vb"_d')

keymap.set("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "fl", "<cmd>Telescope live_grep<cr>", opts)

keymap.set("n", "ne", "<cmd>Neotree toggle float<CR>", opts)
keymap.set("n", "fe", "<cmd>Neotree diagnostics toggle float<CR>", opts)

keymap.set("n", "<A-i>", "<cmd>Lspsaga term_toggle<CR>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("andres.utils").replaceHexWithHSL()
end)
