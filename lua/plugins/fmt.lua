return {
  -- mason-conform.nvim
  -- Mason extension for conform as SOT
  {
    "zapling/mason-conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
    },
    opts = {
      ignore_install = {},
    },
  },
  -- conform.nvim
  -- Lightweight formatter manager
  {
    "stevearc/conform.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "ruff_format" },
        go = { "gofmt" },
      },
    },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        desc = "[f]ormat",
      },
    },
    init = function()
      vim.o.formatexpr = [[v:lua.require'conform'.formatexpr()]]
    end,
  },
  { "imsnif/kdl.vim" },
}
