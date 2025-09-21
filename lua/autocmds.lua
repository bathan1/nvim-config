vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = "powershell.exe -NoProfile -Command Get-Clipboard",
    ["*"] = "powershell.exe -NoProfile -Command Get-Clipboard",
  },
  cache_enabled = 0,
}

-- Set highlight yank setting on
vim.cmd[[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascriptreact", "typescriptreact", "json" },
    callback = function()
        local prettier_config = vim.fn.findfile(".prettierrc", ".;")
        if prettier_config ~= "" then
            local json = vim.fn.system("jq .tabWidth " .. prettier_config)
            local tab_width = tonumber(json) or 2
            vim.opt.tabstop = tab_width
            vim.opt.shiftwidth = tab_width
            vim.opt.expandtab = true
            return
        end
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"javascript", "typescript"},
    callback = function()
        local prettier_config = vim.fn.findfile(".prettierrc", ".;")
        if prettier_config ~= "" then
            local json = vim.fn.system("jq .tabWidth " .. prettier_config)
            local tab_width = tonumber(json) or 2
            vim.opt.tabstop = tab_width
            vim.opt.shiftwidth = tab_width
            vim.opt.expandtab = true
            return
        end
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "java", "ocaml" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescriptreact", "javascriptreact", "html", "css" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

