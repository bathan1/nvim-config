vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
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

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.wo[win].diff then
        vim.wo[win].wrap = true
        vim.wo[win].linebreak = true
        vim.wo[win].number = true
        vim.wo[win].relativenumber = false
      end
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "DiffAdd", {
      bg = "#1E4028",
    })

    vim.api.nvim_set_hl(0, "DiffDelete", {
      bg = "#5C2424",
    })

    vim.api.nvim_set_hl(0, "DiffChange", {
      bg = "#3A3A20",
    })

    vim.api.nvim_set_hl(0, "DiffText", {
      bg = "#686020",
    })
  end,
})

-- so FROM and WHERE have highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "sqlKeyword", { link = "Statement" })
  end,
})
