-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python host program
vim.g.python3_host_prog = vim.fn.exepath("python3")

-- Tab settings (LazyVim defaults to 2, override to 4 for Python)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
