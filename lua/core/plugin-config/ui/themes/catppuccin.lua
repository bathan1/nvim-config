require('catppuccin').setup({
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15
    },
    styles = {
        conditionals = {},
    },
    integrations = {
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" }
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
            },
            inlay_hints = {
                background = true
            }
        }
    }
})

