-- Tabs to two spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Lazy.nvim
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


-- Load Lazy.nvim
local plugins = {
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
}

local opts = {}
require("lazy").setup(plugins, opts)

-- Treesitter Config
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua" },
  highlight = { enable = true },
  indent = { enable = true }, 
})
-- Keybindindings

-- Leader
vim.g.mapleader = " "
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
