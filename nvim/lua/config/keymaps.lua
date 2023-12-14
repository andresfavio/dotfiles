-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local discipline = require("andres.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", opts)

-- Guardar y Salir
keymap.set("n", "<S-q>", "<cmd>q<CR>", opts)
keymap.set("n", "<S-w>", "<cmd>w<CR>", opts)

-- Seleccionar todo el contenido del archivo
keymap.set("n", "<C-a>", "_ggVG", opts)

-- Mover líneas hacia abajo y arriba con Alt-j/k
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>", opts)
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>", opts)

-- Eliminar buffer
keymap.set("n", "<leader>bx", ":bdelete<CR>", opts)

-- mover a otro buffer
keymap.set("n", "<TAB>", "<cmd>bNext<CR>", opts)

-- Buscar palabra bajo el cursor
keymap.set("n", "<leader>/", "/\\<<C-R>=expand('<cword>')<CR>\\><CR>", opts)

-- Eliminar contenido dentro de paréntesis, corchetes o llaves en modo normal
keymap.set("n", "d(", "T(vt)di", opts)
keymap.set("n", "d)", "T(vt)di", opts)

keymap.set("n", "d{", "T{vt}di", opts)
keymap.set("n", "d}", "T{vt}di", opts)

keymap.set("n", "d[", "T[vt]di", opts)
keymap.set("n", "d]", "T[vt]di", opts)

keymap.set("n", "d<", "T<vt>di", opts)
keymap.set("n", "d>", "T<vt>di", opts)

keymap.set("n", 'd"', 'T"vt"di', opts)

keymap.set("n", "d'", "T'vt'di", opts)

-- Eliminar palabra por palabra en modo normal
keymap.set("n", "dw", "diw", opts)

-- Limpiar resaltado de búsqueda
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-- Incrementar y decrementar números
keymap.set("n", "<leader>+", "<C-a>", opts)
keymap.set("n", "<leader>-", "<C-x>", opts)

-- Manejo de ventanas
keymap.set("n", "<leader>sv", "<C-w>v", opts)
keymap.set("n", "<leader>sh", "<C-w>s", opts)
keymap.set("n", "<leader>se", "<C-w>=", opts)
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts)

-- Manejo de Buffers
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts)
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts)
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts)
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts)
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts)

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Float terminal
keymap.set("n", "<A-i>", "<cmd>Lspsaga term_toggle<CR>", opts)

-- Reload configuraciones basicas
keymap.set("n", "<A-l>", "<cmd>so %<CR>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
