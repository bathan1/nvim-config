require('autocmds')
require('keymaps')
if not vim.g.vscode then
    require('plugins')
    require('plugin-config')
end
if vim.g.vscode then
    require("vscode-config")
end
