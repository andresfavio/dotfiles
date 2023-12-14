-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Configuración global de Neovim
local opt = vim.opt -- Para mayor concisión
-- Números de línea
opt.relativenumber = true -- Muestra números relativos
opt.number = true -- Muestra números absolutos en la línea del cursor (cuando los números relativos están activados)

-- Pestañas e indentación
opt.tabstop = 2 -- 2 espacios para las pestañas (predefinido por prettier)
opt.shiftwidth = 2 -- 2 espacios para el ancho de indentación
opt.expandtab = true -- Expande las pestañas a espacios
opt.autoindent = true -- Copia la indentación de la línea actual al iniciar una nueva

-- Ajuste de línea
opt.wrap = false -- Desactiva el ajuste de línea

-- Configuración de búsqueda
opt.ignorecase = true -- Ignora mayúsculas y minúsculas al buscar
opt.smartcase = true -- Si incluyes mayúsculas y minúsculas en tu búsqueda, asume que deseas sensibilidad a mayúsculas y minúsculas

-- Línea de cursor
opt.cursorline = true -- Resalta la línea del cursor

-- Apariencia
opt.termguicolors = true -- Activa los colores terminales (necesario para el esquema de colores nightfly)
opt.background = "dark" -- Los esquemas de colores que pueden ser claros u oscuros se harán oscuros
-- opt.signcolumn = "yes" -- Muestra la columna de signos para que el texto no se desplace

-- Retroceso
opt.backspace = "indent,eol,start" -- Permite retroceso en indentación, fin de línea o posición de inicio del modo de inserción

-- Portapapeles
opt.clipboard:append("unnamedplus") -- Utiliza el portapapeles del sistema como registro predeterminado

-- Divisiones de ventanas
opt.splitright = true -- Divide la ventana verticalmente a la derecha
opt.splitbelow = true -- Divide la ventana horizontalmente hacia abajo

-- Desactiva los archivos de intercambio
opt.swapfile = false

-- Opciones de visualización
opt.showmode = false
opt.showcmd = false
opt.cmdheight = 0

-- Configuración de desplazamiento
opt.scrolloff = 999
opt.sm = true

-- Resaltado de búsqueda
opt.hlsearch = true -- Resalta resultados de búsqueda mientras escribes

-- Guardado automático y recarga
opt.autowrite = true -- Guarda automáticamente el archivo antes de cambiar a otra ventana o abrir otro archivo
opt.autoread = true -- Recarga automáticamente el archivo si ha cambiado en disco

-- Opciones de sesión para la restauración
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- Visualización de caracteres especiales

-- opt.list = true -- Muestra caracteres especiales (como espacios y tabulaciones)
-- opt.listchars = {
--   tab = "▸ ",
--   trail = "·" --[[ , nbsp = "␣", extends = ">", precedes = "<"  ]],
-- } -- Símbolos para las tabulaciones, espacios finales, espacios irrompibles, etc.

-- Autoindentación inteligente según el contexto
opt.smartindent = true

-- Resalta el paréntesis correspondiente al escribir uno
opt.showmatch = true

-- Tiempo de espera para resaltar el paréntesis correspondiente
opt.matchtime = 2

-- Resalta la columna 80
-- opt.colorcolumn = "80"

-- Mejora el comportamiento del menú de comandos
opt.wildmenu = true

-- Controla cómo se completa la pestaña
opt.wildmode = { "longest", "list", "full" }

-- No crea copias de respaldo antes de guardar el archivo
opt.backup = false

-- Habilita la persistencia de la historia de undo después de cerrar y reabrir archivos
opt.undofile = true

-- Reducción del parpadeo al realizar operaciones que modifican el texto
-- opt.lazyredraw = true

opt.syntax = "enable" -- Habilita el resaltado de sintaxis

-- opt.signcolumn = "yes:1" -- Muestra la columna de signos solo si hay más de 1 signo
opt.completeopt = "menuone,noselect" -- Configura las opciones de autocompletado durante la escritura
