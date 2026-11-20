-- Leader must be set before any <leader> mappings
vim.g.mapleader = ","

-- Indentation: 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Search: ignore case unless the pattern has capitals
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Move between splits with Ctrl-h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Splits
vim.keymap.set("n", "<leader>w", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>split<cr>")

-- Common typos
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
