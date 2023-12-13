-- Establecer la tecla líder como espacio
vim.g.mapleader = " "

-- Acceder al módulo de mapeo de teclas de Neovim para mayor concisión
local keymap = vim.keymap
-- Opciones comunes para mapeos
local opts = { noremap = true, silent = true }

---------------------
-- Mapeos Generales --
---------------------

-- Seleccionar todo el contenido del archivo
keymap.set("n", "<C-a>", "_ggVG", opts, { desc = "Seleccionar todo" })

-- Mover líneas hacia abajo y arriba con Alt-j/k
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>", opts, { desc = "Mover línea hacia abajo" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>", opts, { desc = "Mover línea hacia arriba" })

-- Eliminar buffer
keymap.set("n", "<leader>bx", ":bdelete<CR>", opts, { desc = "Eliminar buffer" })

-- Buscar palabra bajo el cursor
keymap.set("n", "<leader>/", "/\\<<C-R>=expand('<cword>')<CR>\\><CR>", opts, { desc = "Buscar palabra bajo cursor" })

-- Eliminar contenido dentro de paréntesis, corchetes o llaves en modo normal
keymap.set("n", "d(", "T(vt)di", opts, { desc = "Eliminar contenido en paréntesis" })
keymap.set("n", "d)", "T(vt)di", opts, { desc = "Eliminar contenido en paréntesis" })

keymap.set("n", "d{", "T{vt}di", opts, { desc = "Eliminar contenido en llaves" })
keymap.set("n", "d}", "T{vt}di", opts, { desc = "Eliminar contenido en llaves" })

keymap.set("n", "d[", "T[vt]di", opts, { desc = "Eliminar contenido en corchetes" })
keymap.set("n", "d]", "T[vt]di", opts, { desc = "Eliminar contenido en corchetes" })

keymap.set("n", "d<", "T<vt>di", opts, { desc = "Eliminar contenido en comparadores" })
keymap.set("n", "d>", "T<vt>di", opts, { desc = "Eliminar contenido en comparadores" })

keymap.set("n", 'd"', 'T"vt"di', opts, { desc = "Eliminar contenido en comillas dobles" })

keymap.set("n", "d'", "T'vt'di", opts, { desc = "Eliminar contenido en comillas simples" })

-- Eliminar palabra por palabra en modo normal
keymap.set("n", "dw", "diw", opts, { desc = "Eliminar palabra" })

-- Salir del modo insert al presionar jk
keymap.set("i", "jk", "<ESC>", opts, { desc = "Salir del modo insert con jk" })

-- Limpiar resaltado de búsqueda
keymap.set("n", "<leader>nh", ":nohl<CR>", opts, { desc = "Limpiar resaltado de búsqueda" })

-- Guardar
keymap.set("n", "<leader>w", ":w<CR>", opts, { desc = "Guardar" })

-- Salir
keymap.set("n", "<leader>q", ":q<CR>", opts, { desc = "Salir" })

-- Saltar entre líneas con Hop
keymap.set("n", "sf", ":HopPattern<CR>", opts, { desc = "Saltar entre líneas con 2 letras" })

-- Saltar a la línea actual con Hop
keymap.set("n", "sfl", ":HopChar1CurrentLine<CR>", opts, { desc = "Búsqueda en la línea actual" })

-- Saltar globalmente con Hop
keymap.set("n", "sg", ":HopChar1<CR>", opts, { desc = "Búsqueda global con una letra" })

-- Navegar entre pestañas con Bufferline
keymap.set("n", "<TAB>", ":BufferlineCycleNext<CR>", opts, { desc = "Siguiente pestaña" })
keymap.set("n", "<S-TAB>", ":BufferlineCyclePrev<CR>", opts, { desc = "Pestaña anterior" })

-- Incrementar y decrementar números
keymap.set("n", "<leader>+", "<C-a>", opts, { desc = "Incrementar número" })
keymap.set("n", "<leader>-", "<C-x>", opts, { desc = "Decrementar número" })

-- Manejo de ventanas
keymap.set("n", "<leader>sv", "<C-w>v", opts, { desc = "Dividir ventana verticalmente" })
keymap.set("n", "<leader>sh", "<C-w>s", opts, { desc = "Dividir ventana horizontalmente" })
keymap.set("n", "<leader>se", "<C-w>=", opts, { desc = "Hacer que las ventanas divididas tengan el mismo tamaño" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts, { desc = "Cerrar la ventana dividida actual" })

-- Manejo de Buffers
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts, { desc = "Abrir nueva pestaña" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts, { desc = "Cerrar pestaña actual" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts, { desc = "Ir a la siguiente pestaña" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts, { desc = "Ir a la pestaña anterior" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts, { desc = "Mover la pestaña actual a una nueva pestaña" })

-- Ver arbol del codigo
keymap.set("n", "<leader>sr", "<cmd>SymbolsOutline<CR>", opts, { desc = "Ver el árbol de todo el código" })

-- LAZY
-- Entrar a Lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", opts, { desc = "Entrar a Lazy" })

-- Sync Lazy
keymap.set("n", "<leader>ls", "<cmd>Lazy sync<CR>", opts, { desc = "Sincronizar plugins" })

-- Actualizar Lazy
keymap.set("n", "<leader>lu", "<cmd>Lazy update<CR>", opts, { desc = "Actualizar Plugins" })

-- Nuevo archivo
keymap.set("n", "<C-n>", ":e ", { desc = "Nuevo Archivo" })

-- Lua
keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)
keymap.set("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)
keymap.set("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end)
keymap.set("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)
keymap.set("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)
keymap.set("n", "gR", function()
  require("trouble").toggle("lsp_references")
end)
