local Util = require("lazyvim.util")
local discipline = require("andres.discipline")

discipline.cowboy()

local map = Util.safe_keymap_set

-- Modo normal
map({ "i" }, "jk", "<ESC>")

-- Mover a la ventana usando las teclas <ctrl> hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana inferior", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana superior", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha", remap = true })

-- Cambiar el tamaño de la ventana usando las teclas de flecha <ctrl>
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Aumentar la altura de la ventana" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Reducir la altura de la ventana" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Reducir el ancho de la ventana" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Aumentar el ancho de la ventana" })

-- Mover líneas
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Mover hacia abajo" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Mover hacia arriba" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Mover hacia abajo" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Mover hacia arriba" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Mover hacia abajo" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Mover hacia arriba" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Siguiente buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Siguiente buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Cambiar a otro buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Cambiar a otro buffer" })

map("n", "<A-l>", "<cmd>bn<CR>")

-- Limpiar búsqueda con <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Salir y limpiar hlsearch" })

-- Limpiar búsqueda, actualizar diferencias y redibujar
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redibujar / limpiar hlsearch / actualizar diferencias" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Siguiente resultado de búsqueda" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Siguiente resultado de búsqueda" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Siguiente resultado de búsqueda" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Resultado de búsqueda anterior" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Resultado de búsqueda anterior" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Resultado de búsqueda anterior" })

-- Agregar puntos de interrupción de deshacer
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Guardar archivo
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar archivo" })

-- keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- Mejorar sangría
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Nuevo archivo
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Nuevo archivo" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Lista de ubicaciones" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Lista de soluciones rápidas" })

map("n", "[q", vim.cmd.cprev, { desc = "Anterior solución rápida" })
map("n", "]q", vim.cmd.cnext, { desc = "Siguiente solución rápida" })

-- Formato
map({ "n", "v" }, "<leader>cf", function()
  Util.format({ force = true })
end, { desc = "Formato" })

-- Diagnóstico
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnósticos de línea" })
map("n", "]d", diagnostic_goto(true), { desc = "Siguiente diagnóstico" })
map("n", "[d", diagnostic_goto(false), { desc = "Diagnóstico anterior" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Siguiente error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Error anterior" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Siguiente advertencia" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Advertencia anterior" })

-- Estilua: ignora el inicio

-- Alternar opciones
map("n", "<leader>uf", function()
  Util.format.toggle()
end, { desc = "Alternar formato automático (global)" })
map("n", "<leader>uF", function()
  Util.format.toggle(true)
end, { desc = "Alternar formato automático (buffer)" })
map("n", "<leader>us", function()
  Util.toggle("spell")
end, { desc = "Alternar revisión ortográfica" })
map("n", "<leader>uw", function()
  Util.toggle("wrap")
end, { desc = "Alternar ajuste de palabra" })
map("n", "<leader>uL", function()
  Util.toggle("relativenumber")
end, { desc = "Alternar números de línea relativos" })
map("n", "<leader>ul", function()
  Util.toggle.number()
end, { desc = "Alternar números de línea" })
map("n", "<leader>ud", function()
  Util.toggle.diagnostics()
end, { desc = "Alternar diagnósticos" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function()
  Util.toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Alternar ocultar" })
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  map("n", "<leader>uh", function()
    Util.toggle.inlay_hints()
  end, { desc = "Alternar sugerencias incrustadas" })
end
map("n", "<leader>uT", function()
  if vim.b.ts_highlight then
    vim.treesitter.stop()
  else
    vim.treesitter.start()
  end
end, { desc = "Alternar resaltado Treesitter" })

-- Lazygit
map("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (directorio raíz)" })
map("n", "<leader>gG", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- Salir
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Salir de todo" })

-- Resalta debajo del cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspeccionar posición" })

-- LazyVim Changelog
map("n", "<leader>L", function()
  Util.news.changelog()
end, { desc = "Changelog de LazyVim" })

-- Terminal flotante
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (directorio raíz)" })
map("n", "<leader>fT", function()
  Util.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (directorio raíz)" })
map("n", "<c-_>", lazyterm, { desc = "ignorar_cualquier_tecla" })

-- Mapeos del terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Entrar en modo normal" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Ir a la ventana izquierda" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Ir a la ventana inferior" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Ir a la ventana superior" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Ir a la ventana derecha" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Ocultar terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "ignorar_cualquier_tecla" })

-- Ventanas
map("n", "<leader>ww", "<C-W>p", { desc = "Otra ventana", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Eliminar ventana", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Dividir ventana abajo", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Dividir ventana a la derecha", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Dividir ventana debajo", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Dividir ventana a la derecha", remap = true })

-- pestañas
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Última pestaña" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Primera pestaña" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Nueva pestaña" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Siguiente pestaña" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Cerrar pestaña" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Pestaña anterior" })
