return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Add this — dart configuration
			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Flutter",
					dartSdkPath = vim.fn.expand("$HOME/flutter/bin/cache/dart-sdk/"),
					flutterSdkPath = vim.fn.expand("$HOME/flutter"),
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			}

			-- Add dart adapter
			dap.adapters.dart = {
				type = "executable",
				command = vim.fn.expand("$HOME/flutter/bin/flutter"),
				args = { "debug-adapter" },
			}

			-- Better icons for breakpoints
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "✗", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "◎", texthl = "DapLogPoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" }
			)

			-- Better colors for signs
			vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75" })
			vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e5c07b" })
			vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#5c6370" })
			vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
			vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
			vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e4d3a" }) -- highlight current stopped line

			dapui.setup({
				icons = {
					expanded = "",
					collapsed = "",
					current_frame = "→",
				},
				controls = {
					enabled = true, -- shows control buttons in UI
					element = "repl",
				},
				-- Better layout (side panel + bottom)
				layouts = {
					{
						-- left side panel
						elements = {
							{ id = "scopes", size = 0.40 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "stacks", size = 0.20 },
							{ id = "watches", size = 0.20 },
						},
						size = 40,
						position = "left", -- side panel like VS Code
					},
					{
						-- bottom panel for repl and console
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
				floating = {
					max_height = 0.9,
					max_width = 0.9,
					border = "rounded", --  rounded borders
				},
			})

			-- auto open/close dapui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- virtual text improvements
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true, -- highlight changed vars
				highlight_new_as_changed = true,
				show_stop_reason = true, -- shows why execution stopped
				commented = false,
				virt_text_pos = "eol", -- show at end of line
				all_frames = false,
				virt_lines = false,
				virt_text_win_col = nil,
			})

			-- Keymaps
			local map = vim.keymap.set
			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			map("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) -- conditional breakpoint
			end, { desc = "Conditional Breakpoint" })
			map("n", "<leader>dc", dap.continue, { desc = "Continue" })
			map("n", "<leader>do", dap.step_over, { desc = "Step Over" })
			map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
			map("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
			map("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
			map("n", "<leader>dr", dap.restart, { desc = "Restart" })
			map("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
			map("n", "<leader>de", dapui.eval, { desc = "Eval expression" })
			map("v", "<leader>de", dapui.eval, { desc = "Eval selection" }) --  eval selected text
			map("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "Hover variable" })
			map("n", "<leader>dl", dap.run_last, { desc = "Run last" }) --  re-run last session
		end,
	},
}
