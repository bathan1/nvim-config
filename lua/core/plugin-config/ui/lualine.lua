require("lualine").setup({
    sections = {
        lualine_x = {
            {
                "buffers",
                mode = 4,
                max_length = vim.o.columns * 1 / 6
            },
            "filetype"
        }
    }
})
