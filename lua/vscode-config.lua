local vscode = require('vscode')

vim.keymap.set(
    "n",
    "-",
    function()
        vscode.call("vsnetrw.open")
    end,
    { noremap = true, silent = true }
)