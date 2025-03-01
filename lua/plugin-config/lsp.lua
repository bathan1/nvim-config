require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'eslint',
        'html',
        'cssls',
        'clangd',
        'pyright',
        'jdtls',
        'tailwindcss',
        'prismals',
        'sqlls',
        'cssmodules_ls',
    }
});
local navic = require("nvim-navic");

local toggle_inlay = function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end

local on_attach = function(client, bufnr)
    -- Attach breadcrumbs plugin to the on_attach fn
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr);
    end

    vim.diagnostic.config({
        virtual_text = false; -- Turn off virtual text since it is ugly af
    });

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
    vim.keymap.set("n", "T", toggle_inlay, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig");

lspconfig.ts_ls.setup({
    on_attach,
    capabilities,
})

lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll"
        })
    end
}

lspconfig.clangd.setup ({
    cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
    init_options = {
        fallbackFlags = { '-std=c11' },
    },
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.yamlls.setup {
    on_attach = on_attach,
    capabilites = capabilities
}

lspconfig.cssmodules_ls.setup {
    on_attach = function (client)
        client.server_capabilities.definitionProvider = false
    end,
    init_options = {
        camelCase = false
    }
}

lspconfig.ocamlls.setup {
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "reason" },
    root_dir = lspconfig.util.root_pattern(".git", "dune-project", "dune-workspace", "esy.lock", "package.json"),
    on_attach = on_attach
}

vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({
        async = true,
		-- Predicate used to filter clients. Receives a client as
		-- argument and must return a boolean. Clients matching the
		-- predicate are included.
        filter = function(client)
            return client.name == "null-ls"
        end,
    })
end)
