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
    "cranberry-clockworks/coal.nvim",
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
        'lukas-reineke/indent-blankline.nvim',
        init = function () 
            vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
                callback = function ()
                    vim.cmd([[
                        hi IndentBlanklineChar gui=nocombine guifg=#444C55
                        hi IndentBlanklineSpaceChar gui=nocombine guifg=#444C55
                        hi IndentBlanklineContextChar gui=nocombine guifg=#FB5E2A
                        hi IndentBlanklineContextStart gui=underline guisp=#FB5E2A
                    ]])
                end,
            })
        end
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
        'mrcjkb/rustaceanvim',
        version = '^4',
        ft = { 'rust' },
    },
    {
        "b0o/lavi.nvim",
        dependencies = { 'rktjmp/lush.nvim' }
    },
    {
        "nyngwang/nvimgelion",
        init = function()
            vim.cmd([[color nvimgelion]])
        end
    }
}

local opts = {}

-- Setup lazy in plugins.lua
require('lazy').setup(plugins, opts)
