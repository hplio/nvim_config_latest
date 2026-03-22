return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                -- General
                mode = "buffers",              -- "buffers" or "tabs"
                numbers = "none",              -- "none" | "ordinal" | "buffer_id" | "both"
                close_command = "bdelete! %d", -- command when closing buffer

                -- Style
                separator_style = "slant", -- "slant" | "thick" | "thin" | "slope" | "padded_slant"
                indicator = {
                    style = "icon",        -- "icon" | "underline" | "none"
                },

                -- Icons
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",

                -- Behaviour
                max_name_length = 18,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 18,

                -- Diagnostics (shows LSP errors on tabs)
                diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,

                -- Sidebar offset (for nvim-tree)
                offsets = {
                    {
                        filetype = "snacks_layout_box",
                        text = "File Explorer",
                        text_align = "center",
                        highlight = "Directory", -- optional: color the title
                        separator = true,
                    }
                },

                -- Misc
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true,
                always_show_bufferline = false,
            }
        })
        local map = vim.keymap.set


        -- Navigate buffers
        map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
        map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

        -- Move buffers
        map("n", "<leader>bn", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
        map("n", "<leader>bp", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

        -- Pick a buffer
        map("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
        map("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })

        -- Close buffers
        map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })
        map("n", "<leader>bD", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close others" })
        map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Close right" })
        map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close left" })

        -- Go to buffer by number
        map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
        map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
        map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
        map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
        map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
    end,
}
