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

local function visual_range()
  local bufnr = vim.api.nvim_get_current_buf()
  local first = vim.fn.getpos("v")
  local last = vim.fn.getpos(".")

  if first[2] > last[2] or (first[2] == last[2] and first[3] > last[3]) then
    first, last = last, first
  end

  local start_col = first[3] - 1
  local end_col = last[3]
  local mode = vim.fn.mode()

  -- A rectangular selection cannot be represented as a formatter range, so
  -- linewise and blockwise selections format every selected row in full.
  if mode == "V" or mode == "\22" then
    start_col = 0
    local line = vim.api.nvim_buf_get_lines(bufnr, last[2] - 1, last[2], false)[1] or ""
    end_col = #line
  end

  return {
    start = { first[2], start_col },
    ["end"] = { last[2], end_col },
  }
end

vim.keymap.set("i", "==", format_current_line, {
  desc = "Format current line",
})

vim.keymap.set("x", "==", function()
  conform.format({ range = visual_range() })
end, {
  desc = "Format selection",
})
