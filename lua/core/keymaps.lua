vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true

-- use spaces for tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.showtabline = 1

vim.opt.signcolumn = "yes"

-- set line numbers to relative 
vim.opt.number = true
vim.opt.relativenumber = true;

-- leader binding for clearing current search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Bind back Ctrl-V to visual block mode
vim.keymap.set('n', '<C-v>', '<C-q>')

-- bindings for tmux navigation
vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>')
