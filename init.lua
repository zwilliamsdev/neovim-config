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

local opts = {}

-- Load Vim Options
require("vim-options")

-- Load Plugins
require("lazy").setup("plugins")

-- Treesitter Config
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua" },
  highlight = { enable = true },
  indent = { enable = true }, 
})
