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
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.marksman.setup({ capabilities = capabilities, single_file_support = false })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      lspconfig.taplo.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
    end,
  },
  -- lspsaga.nvim
  -- Improve nvim lsp experience
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      lightbulb = {
        enable = false,
      },
    },
    keys = {
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "LSP code action" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "LSP hover" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "LSP definition" },
      { "gr", "<cmd>Lspsaga rename<cr>", desc = "LSP rename" },
      { "<leader>to", "<cmd>Lspsaga outline<cr>", desc = "LSP outline" },
      { "<C-W>d", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "LSP show cursor diagnostics" },
    },
  },
  -- lazy-dev.nvim
  -- LuaLS setup for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    config = true,
  },
}
