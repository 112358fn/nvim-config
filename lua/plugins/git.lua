return {
  { "tpope/vim-fugitive" },
  {
    'ruifm/gitlinker.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    keys = function()
      local gitsigns = require("gitsigns")
      return {
        -- Hunks
        { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>",    desc = "git [p]review hunk" },
        { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>",      desc = "git [s]tage hunk" },
        { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "git [u]ndo stage hunk" },
        { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>",      desc = "git [r]eset hunk" },
        { "<leader>h]", "<cmd>Gitsigns nav_hunk next<cr>", desc = "git next hunk" },
        { "<leader>h[", "<cmd>Gitsigns nav_hunk prev<cr>", desc = "git previous hunk" },
        -- Visual hunks
        {
          "<leader>hs",
          mode = { "v" },
          function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "stage git hunk",
        },
        {
          "<leader>hr",
          mode = { "v" },
          function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "stage git hunk",
        },
        -- Toggle
        {
          "<leader>tb",
          "<cmd>Gitsigns toggle_current_line_blame<cr>",
          desc = "[t]oggle git show [b]lame line",
        },
        { "<leader>td", "<cmd>Gitsigns toggle_deleted<cr>", desc = "[t]oggle git show [d]eleted" },
      }
    end,
  },
}
