return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		-- local colors = {
		--           color0 = "#092236",
		--           color1 = "#ff5874",
		--           color2 = "#c3ccdc",
		-- 	color3 = "#1c1e26",
		-- 	color6 = "#a1aab8",
		-- 	color7 = "#828697",
		-- 	color8 = "#ae81ff",
		-- }
		local colors = {
			bg = "#1c1e26", -- dark background
			fg = "#c8d3f5", -- primary text
			blue = "#82aaff", -- NORMAL
			green = "#c3e88d", -- INSERT
			purple = "#c099ff", -- VISUAL
			red = "#ff757f", -- REPLACE / COMMAND
			yellow = "#ffc777", -- WARN / DIFF
			cyan = "#86e1fc", -- BRANCH
			gray = "#545c7e", -- inactive
			darkgray = "#16161e", -- separators
		}
		-- local my_lualine_theme = {
		-- 	replace = {
		-- 		a = { fg = colors.color0, bg = colors.color1, gui = "bold" },
		-- 		b = { fg = colors.color2, bg = colors.color3 },
		-- 	},
		-- 	inactive = {
		-- 		a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
		-- 		b = { fg = colors.color6, bg = colors.color3 },
		-- 		c = { fg = colors.color6, bg = colors.color3 },
		-- 	},
		-- 	normal = {
		-- 		a = { fg = colors.color0, bg = colors.color7, gui = "bold" },
		-- 		b = { fg = colors.color2, bg = colors.color3 },
		-- 		c = { fg = colors.color2, bg = colors.color3 },
		-- 	},
		-- 	visual = {
		-- 		a = { fg = colors.color0, bg = colors.color8, gui = "bold" },
		-- 		b = { fg = colors.color2, bg = colors.color3 },
		-- 	},
		-- 	insert = {
		-- 		a = { fg = colors.color0, bg = colors.color2, gui = "bold" },
		-- 		b = { fg = colors.color2, bg = colors.color3 },
		-- 	},
		-- }
		local my_lualine_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.green, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.red, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
			},
			inactive = {
				a = { fg = colors.gray, bg = colors.bg, gui = "bold" },
				b = { fg = colors.gray, bg = colors.bg },
				c = { fg = colors.gray, bg = colors.bg },
			},
			command = {
				a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
			},
		}
		-- local mode = {
		-- 	"mode",
		-- 	fmt = function(str)
		-- 		-- return ' '
		-- 		-- displays only the first character of the mode
		-- 		return " " .. str
		-- 	end,
		-- }
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}
		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}
		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}
		-- local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }
		local branch = {
			"branch",
			icon = { "", color = { fg = colors.cyan } },
		}

		--  added diagnostics (small addition, very useful)
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_lsp" },
			sections = { "error", "warn", "info", "hint" },
			symbols = {
				error = " ",
				warn = " ",
				info = " ",
				hint = " ",
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		lualine.setup({
			icons_enabled = true,
			options = {
				-- theme = "auto",
				theme = my_lualine_theme,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename, diagnostics },
				lualine_x = {
					{
						-- require("noice").api.statusline.mode.get,
						-- cond = require("noice").api.statusline.mode.has,
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding",},
					-- { "fileformat" },
					{ "filetype" },
				},
			},
		})
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.md",
			callback = function()
				require("lualine").refresh()
			end,
		})
	end,
}
