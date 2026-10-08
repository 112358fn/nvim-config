return {
  -- zk-nvim
  -- Editor integration for the zk notebook ($ZK_NOTEBOOK_DIR).
  -- Needs the `zk` CLI on PATH (home-manager: programs.zk.enable); the LSP is
  -- `zk lsp` from that same binary, so nothing extra to install.
  {
    "zk-org/zk-nvim",
    -- lazy derives the module name from `name`, so this is what makes it call
    -- require("zk").setup(opts) rather than require("zk-nvim").
    name = "zk",
    ft = "markdown",
    cmd = {
      "ZkNew",
      "ZkNotes",
      "ZkTags",
      "ZkMatch",
      "ZkBacklinks",
      "ZkLinks",
      "ZkInsertLink",
      "ZkBuffers",
      "ZkIndex",
      "ZkCd",
    },
    opts = {
      picker = "telescope",
      lsp = {
        config = {
          name = "zk",
          cmd = { "zk", "lsp" },
          filetypes = { "markdown" },
        },
        auto_attach = {
          enabled = true,
        },
      },
      tags = {
        multi_select_strategy = "AND",
      },
    },
    keys = {
      -- Note filenames are random IDs, so links are never typed by hand:
      -- <leader>zi picks the target and inserts [[id]] for you.
      { "<leader>zi", "<Cmd>ZkInsertLink<CR>", desc = "zk insert link" },
      {
        "<leader>zi",
        ":'<,'>ZkInsertLinkAtSelection<CR>",
        mode = "v",
        desc = "zk insert link around selection",
      },
      {
        "<leader>zn",
        "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
        desc = "zk new note",
      },
      {
        "<leader>zn",
        ":'<,'>ZkNewFromTitleSelection<CR>",
        mode = "v",
        desc = "zk new note from selection as title",
      },
      {
        "<leader>zo",
        "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
        desc = "zk open notes",
      },
      {
        "<leader>zf",
        "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
        desc = "zk find notes by content",
      },
      { "<leader>zf", ":'<,'>ZkMatch<CR>", mode = "v", desc = "zk find notes matching selection" },
      { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "zk tags" },
      { "<leader>zb", "<Cmd>ZkBacklinks<CR>", desc = "zk backlinks" },
      { "<leader>zl", "<Cmd>ZkLinks<CR>", desc = "zk outbound links" },
    },
  },
}
