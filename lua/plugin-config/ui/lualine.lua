local navic = require("nvim-navic");

local function smart_filename()
  local filename = vim.fn.expand("%:t")
  local parent = vim.fn.expand("%:h:t")

  -- Count open buffers with same filename
  local count = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local bufname = vim.fn.fnamemodify(
        vim.api.nvim_buf_get_name(buf),
        ":t"
      )
      if bufname == filename then
        count = count + 1
      end
    end
  end

  if count > 1 then
    return parent .. "/" .. filename
  else
    return filename
  end
end

require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
    },

    tabline = {
        lualine_a = {
            {
                "buffers",
                mode = 4
            },
        },
    },
    winbar = {
        lualine_c = {
            smart_filename,
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            }
        }
    }
})
