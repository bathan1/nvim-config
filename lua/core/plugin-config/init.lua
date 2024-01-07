-- Change the theme to whatever theme u want, just have it installed first (duh)
THEME = 'catppuccin'

-- Enable devicons first
require('core.plugin-config.ui.web-devicons')
-- Then enable the theme
require('core.plugin-config.ui.themes.' ..THEME)

-- Set the theme
vim.cmd('colorscheme ' ..THEME)

-- Then setup everything else
require('core.plugin-config.ui.oil')
require('core.plugin-config.ui.lualine')
require('core.plugin-config.ui.gitsigns')
require('core.plugin-config.utils.telescope')
require('core.plugin-config.utils.treesitter')
require('core.plugin-config.lsp.lsp_config')
require('core.plugin-config.utils.completions')
require('core.plugin-config.utils.indent-blankline')
