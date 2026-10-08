return {
  {
    dir = "~/.config/nvim/lua/plugins/review",
    main = "review",
    dependencies = { "tpope/vim-fugitive", "lewis6991/gitsigns.nvim" },
    cmd = { "ReviewStart", "ReviewNext", "ReviewPrev", "ReviewStop" },
    keys = {
      { "]r", "<cmd>ReviewNext<cr>", desc = "Review: next commit" },
      { "[r", "<cmd>ReviewPrev<cr>", desc = "Review: previous commit" },
    },
    opts = { base = "origin/main" },
  },
  {
    "tpope/vim-fugitive",
    init = function()
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "fugitive://*" },
        command = "set bufhidden=delete",
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "FugitiveCommit",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = [[getline(v:lnum) =~# '^diff --git' ? '0' : getline(v:lnum) =~# '^@@' ? '1' : '=']]
          vim.opt_local.foldlevel = 0
        end,
      })
    end,
  },
  {
    -- vim-rhubarb enables GitHub integration for fugitive (e.g., :Gbrowse)
    "tpope/vim-rhubarb",
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup({
        callbacks = {
          -- self-hosted forgejo, which uses gitea-style urls:
          -- https://forge.skygrid.ai/<owner>/<repo>/src/commit/<sha>/<file>#L1-L2
          ["forge%.skygrid%.ai"] = require("gitlinker.hosts").get_gitea_type_url,
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    keys = function()
      local gitsigns = require("gitsigns")
      return {
        -- Hunks
        { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc = "git [p]review hunk" },
        { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "git [s]tage hunk" },
        { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "git [u]ndo stage hunk" },
        { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "git [r]eset hunk" },
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
