return {
  "epwalsh/obsidian.nvim",
  enabled = false,
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = "/mnt/c/Users/19496/Documents/Personal/",
      },
      {
        name = "PayGround",
        path = "~/Documents/Notes/PayGround/",
      },
    },
    checkboxes = {
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
    },
  },
}
