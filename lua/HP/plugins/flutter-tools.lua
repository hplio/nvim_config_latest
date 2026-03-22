return {
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = true,
        ft = "dart",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("flutter-tools").setup({

                -- UI
                ui = {
                    border = "rounded",
                    notification_style = "native", -- "native" | "plugin"
                },

                -- Decorations (virtual text in editor)
                decorations = {
                    statusline = {
                        app_version = true, -- shows flutter version
                        device = true,      -- shows connected device
                        project_config = true,
                    },
                },

                -- Debugger
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    exception_breakpoints = {}, -- stop on exceptions
                    register_configurations = function(_)
                        -- only needed if you have launch.json
                        -- require("dap.ext.vscode").load_launchjs()
                    end,
                },

                -- Flutter binary
                flutter_path = nil,       -- auto detect
                flutter_lookup_cmd = nil, -- auto detect
                fvm = false,              -- set true if you use fvm

                -- Widget guides (visual lines between widgets)
                widget_guides = {
                    enabled = true,
                },

                -- Closing tags (shows closing tag label)
                closing_tags = {
                    highlight = "ErrorMsg",
                    prefix = "  >",
                    enabled = true,
                },

                -- Dev log
                dev_log = {
                    enabled = true,
                    filter = nil,
                    notify_errors = true, -- notify on flutter errors
                    open_cmd = "tabedit", -- "tabedit" | "split" | "vsplit"
                },

                -- Dev tools
                dev_tools = {
                    autostart = false,
                    auto_open_browser = false,
                },

                -- LSP
                lsp = {
                    color = {
                        enabled = true, -- shows color preview
                        background = false,
                        foreground = false,
                        virtual_text = true,
                        virtual_text_str = "■",
                    },
                    settings = {
                        showTodos = true,
                        completeFunctionCalls = true,
                        renameFilesWithClasses = "prompt",
                        enableSnippets = true,
                        updateImportsOnRename = true,
                    },
                },
            })

            -- Keymaps
            local map = vim.keymap.set
            map("n", "<leader>fr", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
            map("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
            map("n", "<leader>fR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Restart" })
            map("n", "<leader>fD", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })
            map("n", "<leader>fe", "<cmd>FlutterEmulators<CR>", { desc = "Flutter Emulators" })
            map("n", "<leader>fl", "<cmd>FlutterLogClear<CR>", { desc = "Flutter Clear Log" })
            map("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
            map("n", "<leader>fv", "<cmd>FlutterVisualDebug<CR>", { desc = "Flutter Visual Debug" })
            map("n", "<leader>fL", "<cmd>FlutterLspRestart<CR>", { desc = "Flutter LSP Restart" })
            map("n", "<leader>fw", "<cmd>FlutterDevToolsActivate<CR>", { desc = "Flutter DevTools Open" })
        end,
    },
}
