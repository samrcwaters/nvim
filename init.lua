-- Basic settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indentation width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.wrap = false -- Disable line wrapping

-- Keymaps
local map = vim.keymap.set
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" })

-- Plugin setup
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Bootstrap packer.nvim if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Lazygit integration
  use({
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open Lazygit" })
    end,
  })

  -- Which-key for keybinding hints
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
end)