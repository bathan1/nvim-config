require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "clangd",
    "pyright",
    "jdtls",
    "tailwindcss",
    "prismals",
    "cssmodules_ls",
    "ts_ls",
  },
})

local navic = require("nvim-navic")

local toggle_inlay = function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end

vim.diagnostic.config({
  virtual_text = false,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities = vim.tbl_deep_extend("force", capabilities, {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
  },
})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gH", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "T", toggle_inlay, opts)
end

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

vim.lsp.config("ts_ls", {
  on_attach = on_attach,

  init_options = {
    preferences = {
      importModuleSpecifier = "non-relative",
      importModuleSpecifierPreference = "non-relative",
    },
  },
})

vim.lsp.config("html", {
  on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
})

vim.lsp.config("cssls", {
  on_attach = on_attach,
})

vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  on_attach = on_attach,
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
})

vim.lsp.config("jdtls", {
  on_attach = on_attach,
})

vim.lsp.config("tailwindcss", {
  on_attach = on_attach,
})

vim.lsp.config("prismals", {
  on_attach = on_attach,
})

vim.lsp.config("cssmodules_ls", {
  on_attach = function(client, bufnr)
    client.server_capabilities.definitionProvider = false
    on_attach(client, bufnr)
  end,

  init_options = {
    camelCase = false,
  },
})

vim.lsp.config("ocamllsp", {
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "reason" },
  root_markers = {
    "dune-project",
    "dune-workspace",
    "esy.lock",
    "package.json",
    ".git",
  },
  on_attach = on_attach,
})

vim.lsp.enable({
  "ts_ls",
  "html",
  "lua_ls",
  "cssls",
  "clangd",
  "pyright",
  "jdtls",
  "tailwindcss",
  "prismals",
  "cssmodules_ls",
  "ocamllsp",
})

vim.keymap.set("n", "<space>f", function()
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end)
