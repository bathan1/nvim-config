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


local function set_buffer_tabwidth(buf, tabwidth)
    if not vim.api.nvim_buf_is_valid(buf) then
        return
    end

    vim.bo[buf].tabstop = tabwidth
    vim.bo[buf].shiftwidth = tabwidth
    vim.bo[buf].expandtab = true
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" },
  desc = "Set the default tab width for web files",
  callback = function(args)
      -- Project-specific indentation can be declared in .editorconfig. Do not
      -- run package managers or formatters synchronously while opening a file.
      set_buffer_tabwidth(args.buf, 2)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "java", "ocaml" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})


