return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        -- "saghen/blink.cmp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- NOTE: LSP Keybinds

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings
                -- Check `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- keymaps
                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end,
        })

        -- NOTE : Moved all this to Mason including local variables
        -- used to enable autocompletion (assign to every lsp server config)
        -- local capabilities = cmp_nvim_lsp.default_capabilities()
        -- Change the Diagnostic symbols in the sign column (gutter)

        -- Define sign icons for each severity
        local signs = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
        }

        -- Set the diagnostic config with all icons
        vim.diagnostic.config({
            signs = {
                text = signs,         -- Enable signs in the gutter
            },
            virtual_text = true,      -- Specify Enable virtual text for diagnostics
            underline = true,         -- Specify Underline diagnostics
            update_in_insert = false, -- Keep diagnostics active in insert mode
        })

        -- NOTE :
        -- Moved back from mason_lspconfig.setup_handlers from mason.lua file
        -- as mason setup_handlers is deprecated & its causing issues with lsp settings
        --
        -- Setup servers
        -- local lspconfig = vim.lsp.config
        -- local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Config lsp servers here
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        -- lua_ls

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
        vim.lsp.enable("lua_ls")

        -- lspconfig.lua_ls.setup({
        --     capabilities = capabilities,
        --     settings = {
        --         Lua = {
        --             diagnostics = {
        --                 globals = { "vim" },
        --             },
        --             completion = {
        --                 callSnippet = "Replace",
        --             },
        --             workspace = {
        --                 library = {
        --                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --                     [vim.fn.stdpath("config") .. "/lua"] = true,
        --                 },
        --             },
        --         },
        --     },
        -- })

        -- emmet_ls
        vim.lsp.config("emmet_ls", {
            filetypes = {
                "html",
                "typescriptreact",
                "javascriptreact",
                "css",
                "sass",
                "scss",
                "less",
                "svelte",
            },
        })
        vim.lsp.enable("emmet_ls")
        -- lspconfig.emmet_ls.setup({
        --     capabilities = capabilities,
        --     filetypes = {
        --         "html",
        --         "typescriptreact",
        --         "javascriptreact",
        --         "css",
        --         "sass",
        --         "scss",
        --         "less",
        --         "svelte",
        --     },
        -- })

        -- emmet_language_server
        vim.lsp.config("emmet_language_server", {
            filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "pug",
                "typescriptreact",
            },
            init_options = {
                includeLanguages = {},
                excludeLanguages = {},
                extensionsPath = {},
                preferences = {},
                showAbbreviationSuggestions = true,
                showExpandedAbbreviation = "always",
                showSuggestionsAsSnippets = false,
                syntaxProfiles = {},
                variables = {},
            },
        })
        vim.lsp.enable("emmet_language_server")
        -- lspconfig.emmet_language_server.setup({
        --     capabilities = capabilities,
        --     filetypes = {
        --         "css",
        --         "eruby",
        --         "html",
        --         "javascript",
        --         "javascriptreact",
        --         "less",
        --         "sass",
        --         "scss",
        --         "pug",
        --         "typescriptreact",
        --     },
        --     init_options = {
        --         includeLanguages = {},
        --         excludeLanguages = {},
        --         extensionsPath = {},
        --         preferences = {},
        --         showAbbreviationSuggestions = true,
        --         showExpandedAbbreviation = "always",
        --         showSuggestionsAsSnippets = false,
        --         syntaxProfiles = {},
        --         variables = {},
        --     },
        -- })

        -- denols
        -- vim.lsp.config("denols", {
        -- 	cmd = { "deno", "lsp" },
        -- 	cmd_env = { NO_COLOR = true },
        -- 	-- filetypes = {
        -- 	-- 	"javascript",
        -- 	-- 	"javascriptreact",
        -- 	-- 	"javascript.jsx",
        -- 	-- 	"typescript",
        -- 	-- 	"typescriptreact",
        -- 	-- 	"typescript.tsx",
        -- 	-- },
        -- 	root_markers = {
        -- 		"deno.json",
        -- 		"deno.jsonc",
        -- 		-- ".git",
        -- 	},
        -- 	settings = {
        -- 		deno = {
        -- 			enable = true,
        -- 			suggest = {
        -- 				imports = {
        -- 					hosts = {
        -- 						["https://deno.land"] = true,
        -- 					},
        -- 				},
        -- 			},
        -- 		},
        -- 	},
        -- 	capabilities = capabilities,
        -- 	root_dir = vim.fs.dirname(vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })[1]),
        -- 	-- root_dir = vim.lsp.config.util.root_pattern("deno.json", "deno.jsonc"),
        -- })
        -- vim.lsp.enable("denols")
        --
        -- lspconfig.denols.setup({
        -- 	capabilities = capabilities,
        -- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        -- })

        -- ts_ls (replaces tsserver)
        vim.lsp.config("ts_ls", {
            filetypes = {
                -- "javascript",
                -- "javascriptreact",
                -- "typescript",
                -- "typescriptreact",
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
            single_file_support = true,
            init_options = {
                preferences = {
                    includeCompletionsForModuleExports = true,
                    includeCompletionsForImportStatements = true,
                },
            },
        })
        vim.lsp.enable("ts_ls")
        -- lspconfig.ts_ls.setup({
        --     capabilities = capabilities,
        --     root_dir = function(fname)
        --         local util = lspconfig.util
        --         return not util.root_pattern("deno.json", "deno.jsonc")(fname)
        --             and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
        --     end,
        --     single_file_support = false,
        --     init_options = {
        --         preferences = {
        --             includeCompletionsWithSnippetText = true,
        --             includeCompletionsForImportStatements = true,
        --         },
        --     },
        -- })
        --
        --
        --DOCKER LSP
        vim.lsp.config("dockerls", {
            root_markers = { "Dockerfile" },
            cmd = { "docker-langserver", "--stdio" },
            filetypes = { "dockerfile" },
            settings = {
                docker = {
                    languageserver = {
                        formatter = {
                            ignoreMultilineInstructions = true,
                        },
                    },
                }
            }
        })

        vim.lsp.enable("docker_compose_language_service")

        vim.lsp.config("docker_compose_language_service", {
            root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
            cmd = { "docker-compose-langserver", "--stdio" },
            filetypes = { "yaml.docker-compose" },

        })

        vim.lsp.enable('docker_compose_language_service')

        -- Rust
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
        })
        vim.lsp.enable("rust_analyzer")

        -- lspconfig.rust_analyzer.setup({
        --       capabilities = capabilities,
        -- })

        -- C LANGUAGE
        vim.lsp.config("clangd", {
            filetypes = {
                "c",
                "cpp",
                "objc",
                "objcpp",
                "cuda",
            },
            cmd = { "clangd" },
            -- cmd = { "clangd", "--background-index", "--clang-tidy" },
            capabilities = {
                offsetEncoding = { "utf-8", "utf-16" },
                textDocument = {
                    completion = {
                        editsNearCursor = true,
                    },
                },
            },

            root_markers = {
                ".clangd",
                ".clang-tidy",
                ".clang-format",
                "compile_commands.json",
                "compile_flags.txt",
                "configure.ac",
                ".git",
            },
        })

        vim.lsp.enable("clangd")

        -- Dart
        vim.lsp.config("dartls", {
            cmd = { "dart", "language-server", "--protocol=lsp" },
            filetypes = {
                "dart",
            },
            init_options = {
                closingLabels = true,
                flutterOutline = true,
                onlyAnalyzeProjectsWithOpenFiles = true,
                outline = true,
                suggestFromUnimportedLibraries = true,
            },
            -- root_dir = vim.lsp.config.util.root_pattern("pubspec.yaml"),
            root_markers = { "pubspec.yaml" },
            capabilities = capabilities,
        })

        vim.lsp.enable("dart")
        --
        -- lspconfig.dartls.setup({
        --     cmd = { "/home/harshil/SDKS/flutter/bin/dart", "language-server", "--protocol=lsp" },
        --     filetypes = { "dart" },
        --     root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
        --     capabilities = capabilities,
        -- })

        -- TAILWIND
        vim.lsp.config("tailwindcss", {
            cmd = { "tailwindcss-language-server", "--stdio" },
            filetypes = {
                "aspnetcorerazor",
                "astro",
                "astro-markdown",
                "blade",
                "clojure",
                "django-html",
                "htmldjango",
                "edge",
                "eelixir",
                "elixir",
                "ejs",
                "erb",
                "eruby",
                "gohtml",
                "gohtmltmpl",
                "haml",
                "handlebars",
                "hbs",
                "html",
                "htmlangular",
                "html-eex",
                "heex",
                "jade",
                "leaf",
                "liquid",
                "markdown",
                "mdx",
                "mustache",
                "njk",
                "nunjucks",
                "php",
                "razor",
                "slim",
                "twig",
                "css",
                "less",
                "postcss",
                "sass",
                "scss",
                "stylus",
                "sugarss",
                "javascript",
                "javascriptreact",
                "reason",
                "rescript",
                "typescript",
                "typescriptreact",
                "vue",
                "svelte",
                "templ",
            },
            settings = {
                tailwindCSS = {
                    classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
                    includeLanguages = {
                        eelixir = "html-eex",
                        elixir = "phoenix-heex",
                        eruby = "erb",
                        heex = "phoenix-heex",
                        htmlangular = "html",
                        templ = "html",
                    },
                    lint = {
                        cssConflict = "warning",
                        invalidApply = "error",
                        invalidConfigPath = "error",
                        invalidScreen = "error",
                        invalidTailwindDirective = "error",
                        invalidVariant = "error",
                        recommendedVariantOrder = "warning",
                    },
                    validate = true,
                },
            },
            workspace_required = true,
        })

        vim.lsp.enable("tailwindcss")

        -- HACK: If using Blink.cmp Configure all LSPs here

        -- ( comment the ones in mason )
        -- local lspconfig = require("lspconfig")
        -- local capabilities = require("blink.cmp").get_lsp_capabilities() -- Import capabilities from blink.cmp

        -- Configure lua_ls
        -- lspconfig.lua_ls.setup({
        --     capabilities = capabilities,
        --     settings = {
        --         Lua = {
        --             diagnostics = {
        --                 globals = { "vim" },
        --             },
        --             completion = {
        --                 callSnippet = "Replace",
        --             },
        --             workspace = {
        --                 library = {
        --                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --                     [vim.fn.stdpath("config") .. "/lua"] = true,
        --                 },
        --             },
        --         },
        --     },
        -- })
        --
        -- -- Configure tsserver (TypeScript and JavaScript)
        -- lspconfig.ts_ls.setup({
        --     capabilities = capabilities,
        --     root_dir = function(fname)
        --         local util = lspconfig.util
        --         return not util.root_pattern('deno.json', 'deno.jsonc')(fname)
        --             and util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')(fname)
        --     end,
        --     single_file_support = false,
        --     on_attach = function(client, bufnr)
        --         -- Disable formatting if you're using a separate formatter like Prettier
        --         client.server_capabilities.documentFormattingProvider = false
        --     end,
        --     init_options = {
        --         preferences = {
        --             includeCompletionsWithSnippetText = true,
        --             includeCompletionsForImportStatements = true,
        --         },
        --     },
        -- })

        -- Add other LSP servers as needed, e.g., gopls, eslint, html, etc.
        -- lspconfig.gopls.setup({ capabilities = capabilities })
        -- lspconfig.html.setup({ capabilities = capabilities })
        -- lspconfig.cssls.setup({ capabilities = capabilities })
    end,
}
