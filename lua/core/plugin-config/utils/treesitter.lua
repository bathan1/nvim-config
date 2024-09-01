require('nvim-treesitter.configs').setup({
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    modules = {},
    ensure_installed = { 'c', 'lua', 'vim', 'javascript', 'typescript', "html", 'css', 'tsx', 'json' },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
        enable_close_on_slash = true,
    },
})

require("nvim-ts-autotag").setup({
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false
    }
})
