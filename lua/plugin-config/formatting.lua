local conform = require("conform")

local prettier = { "prettier", stop_after_first = true }

conform.setup({
  formatters_by_ft = {
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    vue = prettier,
  },
  default_format_opts = {
    lsp_format = "fallback",
    timeout_ms = 3000,
  },
})

local function format_current_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)[1] or ""

  conform.format({
    bufnr = bufnr,
    range = {
      start = { row, 0 },
      ["end"] = { row, #line },
    },
  })
end

vim.keymap.set("n", "==", format_current_line, {
  desc = "Format current line",
})
