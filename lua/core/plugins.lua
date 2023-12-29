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
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  'tiagovla/tokyodark.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  'nvim-lualine/lualine.nvim',
  'lewis6991/gitsigns.nvim',
  'lukas-reineke/indent-blankline.nvim',
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
  { 'folke/neodev.nvim', opts = {} },
  {
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,
  },

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
    event = 'InsertEnter',
    opts = {},
  },
  'Vimjas/vim-python-pep8-indent'

}

local opts = {}

-- Setup lazy in plugins.lua
require('lazy').setup(plugins, opts)
