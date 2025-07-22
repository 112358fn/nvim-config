return {
  { "nvim-lua/plenary.nvim" },
  { "s1n7ax/nvim-window-picker" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
      { "|", ":Neotree toggle show git_status right<CR>", desc = "NeoTree GitStatus", silent = true },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
      },
    },
  },
}
