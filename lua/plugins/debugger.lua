return {
	{
		"mfussenegger/nvim-dap",
		-- dependecies = {
		-- 	"rcarriga/nvim-dap-ui",
		-- },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			vim.keymap.set("n", "<leader>dt", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end)
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("python")
		end,
	},
}
