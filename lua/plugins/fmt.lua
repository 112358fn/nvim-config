return {
  -- conform.nvim
  -- Lightweight formatter manager
  {
    "stevearc/conform.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "prettier", "markdownlint" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        go = { "gofmt", "goimports" },
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
