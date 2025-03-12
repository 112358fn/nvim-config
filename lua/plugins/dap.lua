return {
  -- mason-nvim-dap.nvim
  -- Mason extension for nvim-dap as SOT
  -- NOTE: automatic_installation is not working
  -- use ensure_installed instead
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      -- automatic_installation = true,
      ensure_installed = { "delve", "codelldb", "python" },
      handlers = {},
    },
  },
  -- nvim-dap
  -- DAP client for neovim
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
      }
      -- :h dap-extensions
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "[d]ebug toggle [b]reakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "[d]ebug [c]ontinue" },
    },
  },
  -- nvim-dap-ui
  -- UI for nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    main = "dapui",
    config = true,
  },
  -- nvim-dap-python
  -- Python extension for nvim-dap
  -- configurations to debug python with debugpy
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python")
    end,
  },
  -- nvim-dap-go
  -- Go extension for nvim-dap
  -- configurations to debug Go with delve
  {
    "leoluz/nvim-dap-go",
    config = true,
  },
}
