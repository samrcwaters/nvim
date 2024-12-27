-- TODO
local map = vim.keymap.set

-- Examples:

-- Terminal
-- map({ "n" }, "<leader>;", ":lua NTGlobal['terminal']:toggle()<cr>", { desc = "Open integrated terminal" })
--
-- -- Markdown
-- -- TODO: re-enable for insert mode, only for Markdown files
-- map({ "n", "v" }, "<leader>cx", function()
--   return require("obsidian").util.toggle_checkbox()
-- end, { desc = "Mark checkbox as done" })
-- -- map({ "n", "i", "v" }, "<leader>co", function()
-- --   return require("obsidian").util.()
-- -- end, { desc = "Mark checkbox as done" })
