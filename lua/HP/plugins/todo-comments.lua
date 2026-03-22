return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		todo_comments.setup({
			signs = true, -- show icons in the sign column
			sign_priority = 8,

			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},

			-- gui styling for each keyword
			highlight = {
				multiline = true, -- highlight multiline todo comments
				multiline_pattern = "^.", -- match beginning of each line
				multiline_context = 10, -- extra lines for context
				before = "", -- "fg" or "bg" or ""
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or ""
				after = "fg", -- "fg" or "bg" or ""
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern for highlight
				comments_only = true, -- only highlight in comments
				max_line_len = 400,
				exclude = {}, -- filetypes to exclude
			},

			--  colors for each type
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#dc2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#fbbf24" },
				info = { "DiagnosticInfo", "#2563eb" },
				hint = { "DiagnosticHint", "#10b981" },
				test = { "Identifier", "#ff80ff" },
				perf = { "Identifier", "#fc9867" },
				default = { "Identifier", "#7c3aed" },
			},

			-- search config (used by :TodoTelescope / :TodoFzf)
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				pattern = [[\b(KEYWORDS):]], -- ripgrep pattern
			},
		})

		-- Keymaps
		local map = vim.keymap.set

		-- jump between todos
		map("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		map("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		--  jump to specific type
		map("n", "]e", function()
			todo_comments.jump_next({ keywords = { "FIX", "BUG" } })
		end, { desc = "Next error/bug comment" })

		map("n", "]w", function()
			todo_comments.jump_next({ keywords = { "WARN", "HACK" } })
		end, { desc = "Next warning comment" })

		--  Telescope integration
		map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find all todos" })
		map("n", "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX<CR>", { desc = "Find TODO and FIX" })

		--  quickfix list
		map("n", "<leader>xt", "<cmd>TodoQuickFix<CR>", { desc = "Todo Quickfix list" })
		map("n", "<leader>xT", "<cmd>TodoLocList<CR>", { desc = "Todo Location list" })
	end,
}
