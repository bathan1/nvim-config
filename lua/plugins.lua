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
        "neovim/nvim-lspconfig"
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
    "gpanders/editorconfig.nvim",
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'marko-cerovac/material.nvim'
    },
    {
        "davidmh/mdx.nvim",
        config = true,
        dependencies = {"nvim-treesitter/nvim-treesitter"}
    },
    {
        "ViViDboarder/wombat.nvim",
        dependencies = { { "rktjmp/lush.nvim" } },
        opts = {
            -- You can optionally specify the name of the ansi colors you wish to use
            -- This defaults to nil and will use the default ansi colors for the theme
            ansi_colors_name = nil,
        },
    },
    { 'tiesen243/vercel.nvim' },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
    { 'tiesen243/vercel.nvim' },
    { "rust-lang/rust.vim" },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    { -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        build = "cargo build --release",
        opts = {
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
        },
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    }
}

local opts = {}

-- Setup lazy in plugins.lua
require('lazy').setup(plugins, opts)
