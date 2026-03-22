vim.cmd("let g:netrw_banner = 0")

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true --split vertical window to the right
vim.opt.splitbelow = true --split horizontal window to the bottom

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.clipboard:append("unnamedplus") --use system clipboard as default
vim.opt.hlsearch = true

-- for easy mouse resizing, just incase
vim.opt.mouse = "a"

-- gets rid of line with white spaces
vim.g.editorconfig = true


vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- expose current nvim socket to external programs (flutter devtools fix)
-- vim.fn.setenv("NVIM_LISTEN_ADDRESS", vim.v.servername)

-- TO REMOVE BUFFER ENDING ~
vim.opt.fillchars = { eob = " " }

