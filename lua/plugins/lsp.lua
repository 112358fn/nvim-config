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
      vim.lsp.enable('terraformls')
      vim.lsp.enable('nixd')
    end,
  },
  -- lazy-dev.nvim
  -- LuaLS setup for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    config = true,
  },
}
