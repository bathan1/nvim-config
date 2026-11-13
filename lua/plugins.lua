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
    tag = 'v0.2.2',
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
  'stevearc/conform.nvim',
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
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-o>'] = { 'show', 'fallback' },
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },

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
  { "bathan1/squid" },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    opts = {
      -- or "fzf-lua" or "snacks" or "default"
      picker = "telescope",
      -- Use real files for the review's right side when the PR branch is checked out.
      use_local_fs = true,
      -- bare Octo command opens picker of commands
      enable_builtin = true,
    },
    keys = {
      {
        "<leader>oi",
        "<CMD>Octo issue list<CR>",
        desc = "List GitHub Issues",
      },
      {
        "<leader>op",
        "<CMD>Octo pr list<CR>",
        desc = "List GitHub PullRequests",
      },
      {
        "<leader>od",
        "<CMD>Octo discussion list<CR>",
        desc = "List GitHub Discussions",
      },
      {
        "<leader>on",
        "<CMD>Octo notification list<CR>",
        desc = "List GitHub Notifications",
      },
      {
        "<leader>os",
        function()
          require("octo.utils").create_base_search_command { include_current_repo = true }
        end,
        desc = "Search GitHub",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR "ibhagwan/fzf-lua",
      -- OR "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons", -- optional if file_panel.icons is a function
    },
  }

}

local opts = {}

-- Setup lazy in plugins.lua
require('lazy').setup(plugins, opts)
