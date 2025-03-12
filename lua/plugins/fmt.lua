return {
  -- mason-null-ls.nvim
  -- Mason extension for none-ls as SOT
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      automatic_installation = true,
    },
  },
  -- none-ls.nvim
  -- Expose non-lsp tools as LSP sources
  {
    "nvimtools/none-ls.nvim",
    main = "null-ls",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.formatting.prettierd,
        },
      }
    end,
  },
  -- guard.nvim
  -- Async formatting and linting
  -- NOTE: only used for format using LSP and on save
  {
    "nvimdev/guard.nvim",
    init = function()
      vim.g.guard_config = {
        fmt_on_save = true, -- format on write to buffer
        lsp_as_default_formatter = true,
        save_on_fmt = true,
        auto_lint = false,
      }
    end,
  },
}
