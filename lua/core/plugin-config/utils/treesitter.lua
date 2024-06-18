require('nvim-treesitter.configs').setup({
  auto_install = true,
  ensure_installed = { 'c', 'lua', 'vim', 'javascript', 'typescript', 'css', 'tsx', 'json' },
  highlight = {
    enable = true,
    use_languagetree = true,
  }
})

-- require("nvim-ts-autotag").setup({
--     opts = {
--         enable_close = true,
--         enable_rename = true,
--         enable_close_on_slash = false
--     }
-- })
