return {
	-- NOTE: Rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				-- disable_background = true,
				-- 	disable_nc_background = false,
				-- 	disable_float_background = false,
				-- extend_background_behind_borders = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" }, -- Main background remains transparent
					Pmenu = { bg = "", fg = "#e0def4" }, -- Completion menu background
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" }, -- Highlighted completion item
					PmenuSbar = { bg = "#191724" }, -- Scrollbar background
					PmenuThumb = { bg = "#9ccfd8" }, -- Scrollbar thumb
					-- BufferLine overrides
					BufferLineFill = { bg = "none" },
					BufferLineBackground = { fg = "muted", bg = "none" },
					BufferLineBufferVisible = { fg = "subtle", bg = "none" },
					BufferLineBufferSelected = { fg = "text", bg = "none", bold = true },
					BufferLineSeparator = { fg = "overlay", bg = "none" },
					BufferLineSeparatorVisible = { fg = "overlay", bg = "none" },
					BufferLineSeparatorSelected = { fg = "iris", bg = "none" },
					BufferLineIndicatorSelected = { fg = "iris", bg = "none" },
					BufferLineModified = { fg = "gold", bg = "none" },
					BufferLineModifiedSelected = { fg = "rose", bg = "none" },
					BufferLineCloseButton = { fg = "muted", bg = "none" },
					BufferLineCloseButtonSelected = { fg = "love", bg = "none" },
					BufferLineTab = { fg = "muted", bg = "none" },
					BufferLineTabSelected = { fg = "iris", bg = "none", bold = true },
				},
				enable = {
					terminal = false,
					legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},
			})

			-- HACK: set this on the color you want to be persistent
			-- when quit and reopening nvim
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					-- transparent background like your other themes
					transparent = true,
					terminal_colors = true,
					dim_inactive = false,

					styles = {
						comments = "NONE",
						conditionals = "NONE",
						constants = "NONE",
						functions = "NONE",
						keywords = "bold",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},

					inverse = {
						match_paren = false,
						visual = false,
						search = false,
					},
				},

				-- color overrides
				palettes = {
					nightfox = {
						-- you can override specific colors here
					},
				},

				-- highlight overrides
				groups = {
					all = {
						-- transparent fixes
						Normal = { bg = "NONE" },
						NormalFloat = { bg = "NONE" },
						FloatBorder = { bg = "NONE" },

						-- completion menu
						Pmenu = { bg = "NONE" },
						PmenuSel = { bg = "#2b3b51" },
						PmenuSbar = { bg = "#192330" },
						PmenuThumb = { bg = "#719cd6" },

						-- bufferline
						BufferLineFill = { bg = "NONE" },
						BufferLineBackground = { fg = "#526176", bg = "NONE" },
						BufferLineBufferVisible = { fg = "#71839b", bg = "NONE" },
						BufferLineBufferSelected = { fg = "#cdcecf", bg = "NONE", style = "bold" },
						BufferLineSeparator = { fg = "#2b3b51", bg = "NONE" },
						BufferLineSeparatorVisible = { fg = "#2b3b51", bg = "NONE" },
						BufferLineSeparatorSelected = { fg = "#719cd6", bg = "NONE" },
						BufferLineIndicatorSelected = { fg = "#719cd6", bg = "NONE" },
						BufferLineModified = { fg = "#dbc074", bg = "NONE" },
						BufferLineModifiedSelected = { fg = "#f4a261", bg = "NONE" },
						BufferLineCloseButton = { fg = "#526176", bg = "NONE" },
						BufferLineCloseButtonSelected = { fg = "#c94f6d", bg = "NONE" },
						BufferLineTabSelected = { fg = "#719cd6", bg = "NONE", style = "bold" },
					},
				},
			})

			vim.cmd("colorscheme nightfox")
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function()
			require("nordic").setup({
				-- transparent background
				transparent = {
					bg = true, -- main background transparent
					float = true, -- floating windows transparent
				},

				bright_border = false,
				reduced_blue = true, -- less blue, easier on eyes

				-- italic/bold
				italic = false,
				bold = false,

				-- cursorline
				cursorline = {
					bold = false,
					bold_number = true,
					theme = "dark", -- "dark" | "light"
				},

				-- override highlights (like your other themes)
				on_highlight = function(highlights, _)
					-- transparent fixes
					highlights.Normal = { bg = "NONE" }
					highlights.NormalFloat = { bg = "NONE" }
					highlights.FloatBorder = { bg = "NONE" }

					-- completion menu
					highlights.Pmenu = { bg = "NONE" }
					highlights.PmenuSel = { bg = "#3b4252" }
					highlights.PmenuSbar = { bg = "#2e3440" }
					highlights.PmenuThumb = { bg = "#81a1c1" }

					-- bufferline
					highlights.BufferLineFill = { bg = "NONE" }
					highlights.BufferLineBackground = { fg = "#616e88", bg = "NONE" }
					highlights.BufferLineBufferSelected = { fg = "#eceff4", bg = "NONE", bold = true }
					highlights.BufferLineSeparator = { fg = "#3b4252", bg = "NONE" }
					highlights.BufferLineSeparatorSelected = { fg = "#81a1c1", bg = "NONE" }
					highlights.BufferLineIndicatorSelected = { fg = "#81a1c1", bg = "NONE" }
					highlights.BufferLineModified = { fg = "#ebcb8b", bg = "NONE" }
					highlights.BufferLineModifiedSelected = { fg = "#d08770", bg = "NONE" }
					highlights.BufferLineCloseButton = { fg = "#616e88", bg = "NONE" }
					highlights.BufferLineCloseButtonSelected = { fg = "#bf616a", bg = "NONE" }
				end,
			})

			require("nordic").load()
			-- vim.cmd("colorscheme nordic")
		end,
	},
	-- NOTE: gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		-- priority = 1000 ,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
					operators = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					Pmenu = { bg = "" }, -- Completion menu background
					BufferLineFill = { bg = "none" },
					BufferLineBackground = { link = "GruvboxBg2" },
					BufferLineBufferVisible = { fg = "#a89984", bg = "none" },
					BufferLineBufferSelected = { fg = "#ebdbb2", bg = "none", bold = true },
					BufferLineSeparator = { fg = "#504945", bg = "none" },
					BufferLineSeparatorVisible = { fg = "#504945", bg = "none" },
					BufferLineSeparatorSelected = { fg = "#d79921", bg = "none" },
					BufferLineIndicatorSelected = { fg = "#d79921", bg = "none" },
					BufferLineModified = { fg = "#d79921", bg = "none" },
					BufferLineModifiedSelected = { fg = "#fe8019", bg = "none" },
					BufferLineCloseButton = { fg = "#a89984", bg = "none" },
					BufferLineCloseButtonSelected = { fg = "#cc241d", bg = "none" },
					BufferLineTab = { fg = "#a89984", bg = "none" },
					BufferLineTabSelected = { fg = "#d79921", bg = "none", bold = true },
				},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
	-- NOTE: Kanagwa
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						dragon = {},
						all = {
							ui = {
								bg_gutter = "none",
								border = "rounded",
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						Pmenu = { fg = theme.ui.shade0, bg = "NONE", blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptBorder = { fg = theme.ui.special },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim },
						TelescopeResultsBorder = { fg = theme.ui.special },
						TelescopePreviewBorder = { fg = theme.ui.special },
						-- BufferLine overrides
						BufferLineFill = { bg = "none" },
						BufferLineBackground = { fg = theme.ui.fg_dim, bg = "none" },
						BufferLineBufferVisible = { fg = theme.ui.fg_dim, bg = "none" },
						BufferLineBufferSelected = { fg = theme.ui.fg, bg = "none", bold = true },
						BufferLineSeparator = { fg = theme.ui.bg_p1, bg = "none" },
						BufferLineSeparatorVisible = { fg = theme.ui.bg_p1, bg = "none" },
						BufferLineSeparatorSelected = { fg = theme.syn.special1, bg = "none" },
						BufferLineIndicatorSelected = { fg = theme.syn.special1, bg = "none" },
						BufferLineModified = { fg = theme.syn.string, bg = "none" },
						BufferLineModifiedSelected = { fg = theme.diag.warning, bg = "none" },
						BufferLineCloseButton = { fg = theme.ui.fg_dim, bg = "none" },
						BufferLineCloseButtonSelected = { fg = theme.diag.error, bg = "none" },
						BufferLineTab = { fg = theme.ui.fg_dim, bg = "none" },
						BufferLineTabSelected = { fg = theme.syn.special1, bg = "none", bold = true },
					}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
				},
			})
		end,
	},
	-- NOTE: neosolarized
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = false },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = c.bg_dark,
					}
					hl.TelescopePromptBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = "#2C94DD",
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					-- BufferLine overrides
					hl.BufferLineFill = { bg = "NONE" }
					hl.BufferLineBackground = { fg = c.fg_gutter, bg = "NONE" }
					hl.BufferLineBufferVisible = { fg = c.fg_dark, bg = "NONE" }
					hl.BufferLineBufferSelected = { fg = c.fg, bg = "NONE", bold = true }
					hl.BufferLineSeparator = { fg = c.border, bg = "NONE" }
					hl.BufferLineSeparatorVisible = { fg = c.border, bg = "NONE" }
					hl.BufferLineSeparatorSelected = { fg = c.blue, bg = "NONE" }
					hl.BufferLineIndicatorSelected = { fg = c.blue, bg = "NONE" }
					hl.BufferLineModified = { fg = c.yellow, bg = "NONE" }
					hl.BufferLineModifiedSelected = { fg = c.orange, bg = "NONE" }
					hl.BufferLineCloseButton = { fg = c.fg_gutter, bg = "NONE" }
					hl.BufferLineCloseButtonSelected = { fg = c.red, bg = "NONE" }
					hl.BufferLineTab = { fg = c.fg_gutter, bg = "NONE" }
					hl.BufferLineTabSelected = { fg = c.blue, bg = "NONE", bold = true }
				end,
			})
		end,
	},
	-- NOTE : tokyonight
	{
		"folke/tokyonight.nvim",
		name = "folkeTokyonight",
		-- priority = 1000,
		config = function()
			local transparent = true
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,

				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = transparent and colors.none or bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
				on_highlights = function(hl, c)
					-- BufferLine overrides
					hl.BufferLineFill = { bg = "NONE" }
					hl.BufferLineBackground = { fg = c.fg_gutter, bg = "NONE" }
					hl.BufferLineBufferVisible = { fg = c.fg_dark, bg = "NONE" }
					hl.BufferLineBufferSelected = { fg = c.fg, bg = "NONE", bold = true }
					hl.BufferLineSeparator = { fg = c.border, bg = "NONE" }
					hl.BufferLineSeparatorVisible = { fg = c.border, bg = "NONE" }
					hl.BufferLineSeparatorSelected = { fg = "#5b8cff", bg = "NONE" }
					hl.BufferLineIndicatorSelected = { fg = "#5b8cff", bg = "NONE" }
					hl.BufferLineModified = { fg = c.yellow, bg = "NONE" }
					hl.BufferLineModifiedSelected = { fg = c.orange, bg = "NONE" }
					hl.BufferLineCloseButton = { fg = c.fg_gutter, bg = "NONE" }
					hl.BufferLineCloseButtonSelected = { fg = c.red, bg = "NONE" }
					hl.BufferLineTab = { fg = c.fg_gutter, bg = "NONE" }
					hl.BufferLineTabSelected = { fg = "#5b8cff", bg = "NONE", bold = true }
				end,
			})
			vim.cmd("colorscheme tokyonight")
			-- NOTE: Auto switch to tokyonight for markdown files only
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown" },
				callback = function()
					-- Ensure the theme switch only happens once for a buffer
					local buffer = vim.api.nvim_get_current_buf()
					if not vim.b[buffer].tokyonight_applied then
						if vim.fn.expand("%:t") ~= "" and vim.bo[0].buftype ~= "nofile" then
							-- if vim.fn.expand("%:t") ~= "" and vim.api.nvim_buf_get_option(0, "buftype") ~= "nofile" then
							vim.cmd("colorscheme tokyonight")
						end
						vim.b[buffer].tokyonight_applied = true
					end
				end,
			})
		end,
	},

	--NOTE:  catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
		config = function()
			local transparent = true

			require("catppuccin").setup({
				flavour = "mocha",

				transparent_background = transparent,
				default_integrations = true,

				styles = {
					comments = { "italic" },
					keywords = { "bold" },
				},

				color_overrides = {
					mocha = {
						base = "#0b0f14",
						mantle = "#0f141b",
						crust = "#080c10",

						text = "#e6edf3",
						subtext1 = "#b4c0cc",

						surface0 = "#1a222d",
						surface1 = "#222b37",
						surface2 = "#2a3441",

						overlay0 = "#5c6b7a",
						overlay1 = "#6b7c8f",

						mauve = "#c678dd",
						blue = "#5b8cff",
						red = "#ff5f6d",
						green = "#9ece6a",
						yellow = "#e0af68",
						peach = "#ff9e64",
					},
				},

				custom_highlights = function(colors)
					return {
						Normal = { bg = transparent and "NONE" or colors.base },
						NormalFloat = { bg = transparent and "NONE" or colors.mantle },
						FloatBorder = { fg = colors.overlay1 },

						CursorLine = { bg = colors.surface0 },
						Visual = { bg = colors.surface1 },

						Search = { bg = colors.peach, fg = "#000000" },
						IncSearch = { bg = colors.red, fg = "#000000" },

						LineNr = { fg = colors.overlay0 },
						CursorLineNr = { fg = colors.mauve },

						StatusLine = {
							bg = transparent and "NONE" or colors.surface0,
							fg = colors.text,
						},
						-- BufferLine overrides
						BufferLineFill = { bg = "NONE" },
						BufferLineBackground = { fg = colors.overlay0, bg = "NONE" },
						BufferLineBufferVisible = { fg = colors.subtext1, bg = "NONE" },
						BufferLineBufferSelected = { fg = colors.text, bg = "NONE", bold = true },
						BufferLineSeparator = { fg = colors.surface0, bg = "NONE" },
						BufferLineSeparatorVisible = { fg = colors.surface0, bg = "NONE" },
						BufferLineSeparatorSelected = { fg = colors.mauve, bg = "NONE" },
						BufferLineIndicatorSelected = { fg = colors.mauve, bg = "NONE" },
						BufferLineModified = { fg = colors.yellow, bg = "NONE" },
						BufferLineModifiedSelected = { fg = colors.peach, bg = "NONE" },
						BufferLineCloseButton = { fg = colors.overlay0, bg = "NONE" },
						BufferLineCloseButtonSelected = { fg = colors.red, bg = "NONE" },
						BufferLineTab = { fg = colors.overlay0, bg = "NONE" },
						BufferLineTabSelected = { fg = colors.mauve, bg = "NONE", bold = true },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
