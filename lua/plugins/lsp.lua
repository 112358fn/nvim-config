return {
  -- mason.nvim
  -- Mason: Package Manager for LSP servers, DAP servers, linters and formatters
  {
    "williamboman/mason.nvim",
    config = true,
  },
  -- mason-lspconfig.nvim
  -- Mason extension for lspconfig as SOT
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      automatic_installation = true,
    },
  },
  -- mason-null-ls.nvim
  -- Mason extension for none-ls as SOT
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    opts = {
      automatic_installation = true,
    },
  },
  -- nvim-lspconfig
  -- neovim default configurations for LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ruff.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.marksman.setup({ capabilities = capabilities, single_file_support = false })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
    end,
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
          null_ls.builtins.formatting.markdownlint,
        },
      }
    end,
  },
  -- guard.nvim
  -- Async formatting and linting
  -- NOTE: only used for format on save
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
  -- lspsaga.nvim
  -- Improve nvim lsp experience
  {
    "nvimdev/lspsaga.nvim",
    event = 'LspAttach',
    config = true,
    keys = {
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "LSP code action" },
      {"K", '<cmd>Lspsaga hover_doc<cr>', desc = "LSP hover"}
    },
  },
}
