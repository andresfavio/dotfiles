local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "andres.plugins" },
  { import = "andres.plugins.lsp" },
}, {
  install = {
    colorscheme = { "solarized-osaka" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Configuracion de colores de los border de algunos plugins

-- TELESCOPE
-- Seleccion de telescope
vim.cmd([[
  hi TelescopeSelection guibg=#002c38 guifg=#849900 gui=bold
]])
-- Bordes telescope
vim.cmd([[ hi TelescopeBorder guifg=#1c716a
 ]])

-- NOICE
-- Borde cmd line
vim.cmd([[ hi NoiceCmdlinePopupBorderCmdline guifg=#1c716a
 ]])
-- Icon cmd line
vim.cmd([[ hi NoiceCmdlineIconCmdline guifg=#849900  ]])

-- WhichKey
-- Border de WhichKey
vim.cmd([[ hi WhichKeyBorder guifg=#1c716a  ]])

-- trouble
vim.cmd([[ hi TroubleNormal guibg=#001419  ]])
