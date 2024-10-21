require('autocmds')
require('keymaps')
if not vim.g.vscode then
    require('plugins')
    require('plugin-config')
end
