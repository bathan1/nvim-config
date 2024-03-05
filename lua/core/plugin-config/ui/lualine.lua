local navic = require("nvim-navic");

require("lualine").setup({
    winbar = {
        lualine_a = {
            {
                "buffers",
                mode = 4
            }
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
