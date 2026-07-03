local treesitter = require("nvim-treesitter")

local parsers = {
    "c",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "ocaml",
    "rust",
    "tsx",
    "typescript",
    "vim",
}

treesitter.setup({})
treesitter.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "c",
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "markdown",
        "ocaml",
        "rust",
        "typescript",
        "typescriptreact",
        "vim",
    },
    callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

require("nvim-ts-autotag").setup({
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false
    }
})
