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
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
    },
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
    {
      'saghen/blink.cmp',
      dependencies = {
        'saghen/blink.lib',
        -- optional: provides snippets for the snippet source
        'rafamadriz/friendly-snippets',
      },
      build = function()
        require('blink.cmp').build({ force = true }):pwait(60000)
      end,
    
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },
    
        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },
    
        -- (Default) list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    
        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"`
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" },
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
    },
    { "bathan1/sqld" }

}

local opts = {}

-- Setup lazy in plugins.lua
require('lazy').setup(plugins, opts)
