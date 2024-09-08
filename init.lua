require('core.autocmds')
require('core.keymaps')
if not vim.g.vscode then
    require('core.plugins')
    require('core.plugin-config')
end
