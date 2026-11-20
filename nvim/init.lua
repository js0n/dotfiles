-- Leader must be set before any <leader> mappings
vim.g.mapleader = ","

-- nvim-tree replaces netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Plugins (built-in vim.pack; versions pinned in nvim-pack-lock.json)
vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/folke/tokyonight.nvim",
})

-- Colors: Tokyo Night, matching Ghostty (Night when dark, Day when light)
require("tokyonight").setup({ style = "night", light_style = "day" })
vim.cmd.colorscheme("tokyonight")

-- File tree
require("nvim-tree").setup({
    on_attach = function(bufnr)
        require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
        -- Free Ctrl-e inside the tree so it toggles the tree closed
        vim.keymap.del("n", "<C-e>", { buffer = bufnr })
    end,
})
vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>")

-- Fuzzy finder
require("telescope").setup()
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>o", telescope.find_files)
vim.keymap.set("n", "<leader>a", telescope.live_grep)
