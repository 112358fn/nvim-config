return {
  -- nvim-lspconfig
  -- neovim default configurations for LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('pyright')
      vim.lsp.enable('marksman')
      vim.lsp.enable('gopls')
      vim.lsp.enable('yamlls')
      vim.lsp.enable('bashls')
      vim.lsp.enable('rust_analyzer')
      vim.lsp.enable('taplo')
      vim.lsp.enable('ts_ls')
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
