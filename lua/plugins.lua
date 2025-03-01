-- Lazy package manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Other UI plugins
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },
    { 'rose-pine/neovim', name = 'rose-pine' },
    { "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    'tiagovla/tokyodark.nvim',
    'rebelot/kanagawa.nvim',
    'nvim-tree/nvim-web-devicons',
    "onsails/lspkind.nvim",
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = "nvim-tree/nvim-web-devicons"
    },
    { 'folke/neodev.nvim', opts = {} },
    'nvim-lualine/lualine.nvim',
    'lewis6991/gitsigns.nvim',
    {
        'lukas-reineke/indent-blankline.nvim'
    },

    -- Syntax highlighting and Language Support
    'nvim-treesitter/nvim-treesitter',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    {
        'neovim/nvim-lspconfig',
    },
    {
        'numToStr/Comment.nvim',
        opts = {
        },
        lazy = false,
    },
    "SmiteshP/nvim-navic",

    -- Text stuff
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'numToStr/Comment.nvim',
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'windwp/nvim-ts-autotag',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        lazy = true,
        event = 'VeryLazy',
    },
    'Vimjas/vim-python-pep8-indent',
    {
        "b0o/lavi.nvim",
        dependencies = { 'rktjmp/lush.nvim' }
    },
    {
        "nyngwang/nvimgelion",
    },
    {
        "sainnhe/everforest"
    },
    {
        "dgox16/oldworld.nvim"
    },
    {
        "ramojus/mellifluous.nvim"
    },
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

    {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        }
    end
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    { "EdenEast/nightfox.nvim" },
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local elixir = require("elixir")
            local elixirls = require("elixir.elixirls")
            elixir.setup {
                nextls = {enable = true},
                elixirls = {
                    enable = true,
                    settings = elixirls.settings {
                        dialyzerEnabled = false,
                        enableTestLenses = false,
                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                    end,
                },
                projectionist = {
                    enable = true
                }
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    "gpanders/editorconfig.nvim",
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
}

local opts = {}

-- Setup lazy in plugins.lua
require('lazy').setup(plugins, opts)
