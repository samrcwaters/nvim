local map = vim.keymap.set

-- Markdown
map({ "n", "v" }, "<leader>cx", function()
  return require("obsidian").util.toggle_checkbox()
end, { desc = "Mark checkbox as done" })
-- map({ "n", "i", "v" }, "<leader>co", function()
--   return require("obsidian").util.()
-- end, { desc = "Mark checkbox as done" })
