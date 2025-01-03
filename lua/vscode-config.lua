local vscode = require('vscode')

vim.keymap.set(
    "n",
    "-",
    function()
        vscode.call("vsnetrw.open")
    end,
    { noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    '<space>rn', 
    function()
        vscode.call("editor.action.rename")
    end
    ,
    {}
)
vim.keymap.set(
    { 'n', 'v' }, 
    '<space>ca', 
    function()
        vscode.call("editor.action.codeAction")
    end, 
    {}
)
vim.keymap.set(
    'n',
    'gr', 
    function()
        vscode.call("editor.action.referenceSearch.trigger")
    end
    , 
    {}
)