require("lualine").setup({
    sections = {
        lualine_x = {
            {
                "buffers",
                mode = 3,
                max_length = vim.o.columns * 1 / 4
            },
            "filetype"
        }
    }
})
