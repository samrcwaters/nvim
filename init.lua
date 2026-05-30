vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.wrap = false -- Disable line wrapping
vim.opt.termguicolors = true -- Enable true color support

vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })

-- Sync clipboard between OS and Neovim -- scheduled after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Save undo history
vim.opt.undofile = true

-- Enable local configurations (.nvim.lua)
vim.o.exrc = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require("lazy").setup({
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
  { "folke/which-key.nvim", opts = {} },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      -- Keychain helper for DB passwords
      local function get_db_password(service, account)
        local cmd = string.format('security find-generic-password -s "%s" -a "%s" -w', service, account)
        local result = vim.fn.trim(vim.fn.system(cmd))
        if vim.v.shell_error ~= 0 then
          return nil
        end
        return result
      end

      -- Expose helper globally for use in g:dbs
      _G.get_db_password = get_db_password
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "4916d6592ede8c07973490d9322f187e07dfefac",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })
      require("nvim-treesitter").install({ "javascript", "typescript", "tsx", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" })
    end,
  },
})

-- Enable Treesitter highlighting and indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "lua", "vim", "vimdoc", "query", "markdown" },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- DBUI Keybindings
vim.keymap.set("n", "<leader>du", "<cmd>DBUIToggle<cr>", { desc = "Toggle DBUI" })
vim.keymap.set("n", "<leader>df", "<cmd>DBUIFindBuffer<cr>", { desc = "Find DBUI Buffer" })
vim.keymap.set("n", "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", { desc = "Rename DBUI Buffer" })
vim.keymap.set("n", "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", { desc = "Last Query Info" })


