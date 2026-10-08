return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "lua", "python", "rust", "go", "yaml"})
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "python", "rust", "go" },
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  -- nvim-ufo
  -- Ultra Fold in neovim
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
    init = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
    end,
  },
}
