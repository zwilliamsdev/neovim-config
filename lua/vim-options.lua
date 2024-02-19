-- Tabs to two spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- ColorColumn
vim.cmd("set colorcolumn=80")

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Leader
vim.g.mapleader = " "

-- Mappings
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message"})
vim.keymap.set("n", "<leader>nm", "<cmd>Telescope noice<CR>", { desc = "Dismiss Noice Message"})
