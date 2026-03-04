return {
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        desc = "Open CodeCompanion",
      },
      {
        "<leader>ac",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Toggle CodeCompanion Chat",
      },
      {
        "<leader>av",
        "<cmd>CodeCompanionChat Add<cr>",
        desc = "Add selection to CodeCompanion Chat",
        mode = "v",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    ft = { "codecompanion" },
  },
}
