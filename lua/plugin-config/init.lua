-- Change the theme to whatever theme u want, just have it installed first (duh)
-- Enable devicons first
require('plugin-config.ui.web-devicons')
require('plugin-config.lsp')
require('plugin-config.ui.oil')
require('plugin-config.ui.lualine')
require('plugin-config.ui.gitsigns')
require('plugin-config.utils.telescope')
require('plugin-config.utils.treesitter')
require('plugin-config.utils.completions')
require('plugin-config.utils.indent-blankline')

require("vercel").setup({
    theme = "dark"
})
vim.cmd("colorscheme vercel")
