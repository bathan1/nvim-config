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


local function resolve_prettier_tabwidth_for(bufpath)
  if bufpath == nil or bufpath == "" then return nil end

  local cfg_path = vim.fn.system(
    "npx --yes prettier --find-config-path " .. vim.fn.shellescape(bufpath)
  )
  if cfg_path == nil or cfg_path == "" then return nil end

  local cmd = [[node -e "const p=require('prettier');p.resolveConfig(process.argv[1]).then(c=>{console.log(c && c.tabWidth || '');}).catch(()=>console.log(''))" ]]
    .. vim.fn.shellescape(bufpath)

  local out = vim.fn.system(cmd)
  local tw = tonumber((out or ""):gsub("%s+$", ""), 10)

  return tw
end

local tabwidths = {}
local function apply_tabs_from_prettier(args)
    local file = args.file or vim.api.nvim_buf_get_name(args.buf)
    local ext = file:match("^.+%.([^./\\]+)$")
    local cached_tw = tabwidths[ext]
    if cached_tw ~= nil then
        vim.opt_local.tabstop = cached_tw
        vim.opt_local.shiftwidth = cached_tw
        vim.opt_local.expandtab = true
    else
        local tw = resolve_prettier_tabwidth_for(file)
        if tw then
            vim.opt_local.tabstop = tw
            vim.opt_local.shiftwidth = tw
            vim.opt_local.expandtab = true
            tabwidths[ext] = tw
        else
            -- fallback if no prettier config
            if ext == ".jsx" or ext == ".tsx" then
                vim.opt_local.tabstop = 2
                vim.opt_local.shiftwidth = 2
                tabwidths[ext] = 2
            elseif ext == ".js" or ext == ".ts" then
                vim.opt_local.tabstop = 4
                vim.opt_local.shiftwidth = 4
                tabwidths[ext] = 4
            else
                vim.opt_local.tabstop = 2
                vim.opt_local.shiftwidth = 2
                tabwidths[ext] = 2
            end
            vim.opt_local.expandtab = true
        end
    end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" },
  callback = apply_tabs_from_prettier,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "java", "ocaml" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end
})


