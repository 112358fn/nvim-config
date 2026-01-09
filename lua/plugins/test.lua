return {
  { "nvim-neotest/nvim-nio" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    config = function()
      ---@diagnostic disable: missing-fields
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            pytest_discover_instances = true,
          }),
          require("neotest-rust")({
            args = { "--no-capture" },
            dap_adapter = "codelldb",
          }),
          require("neotest-golang"),
        },
      })
      ---@diagnostic enable
    end,
    keys = {
      {
        "<leader>dt",
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "[d]ebug [t]est",
      },
      {
        "<leader>tt",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "[t]oggle [t]est summary",
      },
    },
  },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "rouge8/neotest-rust",
  },
  {
    "fredrikaverpil/neotest-golang",
    dependencies = {
      "leoluz/nvim-dap-go",
    },
  },
}
