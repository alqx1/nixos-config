local opt = vim.opt

vim.opt.list = true
vim.opt.listchars = { trail = "·" }

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 10

opt.termguicolors = true

opt.clipboard:append("unnamedplus")
