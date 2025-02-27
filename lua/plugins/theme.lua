return {
  {
    "catppuccin/nvim",
    name = "catpuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-latte")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
}
