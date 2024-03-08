local navic = require("nvim-navic");

require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
    },

    tabline = {
        lualine_a = {
            {
                "buffers",
                mode = 4
            }
        },
    },
    winbar = {
        lualine_a = {
            "filename"
        },
        lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            }
        }
    }
})
