require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
      'lua_ls',
      'tsserver',
      'eslint',
      'html',
      'cssls',
      'clangd',
      'pyright',
      'jdtls',
      'lemminx',
      'tailwindcss',
      'prismals',
      'sqlls'
  }
});
local navic = require("nvim-navic");

-- Global mappings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev);
vim.keymap.set('n', ']d', vim.diagnostic.goto_next);
vim.keymap.set("n", "gh", vim.diagnostic.open_float, {});

local on_attach = function(client, bufnr)
    -- Attach breadcrumbs plugin to the on_attach fn
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr);
    end

    vim.diagnostic.config({
        virtual_text = false; -- Turn off virtual text since it is ugly af
    });

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {});
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {});
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {});
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {});
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig').eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").yamlls.setup {
    on_attach = on_attach,
    capabilites = capabilities
}
