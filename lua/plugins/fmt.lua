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
  { "imsnif/kdl.vim" },
}
