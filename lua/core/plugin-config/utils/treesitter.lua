require'nvim-treesitter.configs'.setup {
  auto_install = true,
  ensure_installed = { 'c', 'lua', 'vim', 'javascript', 'typescript', 'html', 'css', 'tsx', 'json' },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  autotag = {
    enable = true,
  },
}
