return {
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
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    end,
  },
  -- lspsaga.nvim
  -- Improve nvim lsp experience
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = true,
    keys = {
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "LSP code action" },
      { "K",          "<cmd>Lspsaga hover_doc<cr>",   desc = "LSP hover" },
      { "<leader>to", "<cmd>Lspsaga outline<cr>",     desc = "LSP outline" },
    },
  },
}
