return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        json = { "prettierd" },
      },
    },
  },
}
