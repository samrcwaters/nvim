-- Basic settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indentation width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.wrap = false -- Disable line wrapping

-- Keymaps
local map = vim.keymap.set

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup using lazy.nvim
require("lazy").setup({
  {},
})
