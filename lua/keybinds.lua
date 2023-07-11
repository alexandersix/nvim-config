local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- File saving --
map("n", "<leader>fs", ":w<cr>", opts)
map("n", "<leader>wq", ":wq<cr>", opts)

-- Window manipulation --
map("n", "<leader>wv", ":vsp<cr>", opts)
map("n", "<leader>wn", ":sp<cr>", opts)
map("n", "<leader>wo", "<C-W>o", opts)

-- Buffers --
map("n", "<leader>bj", "<C-^>", opts)
map("n", "<leader>bn", "<cmd>bnext<cr>", opts)
map("n", "<leader>bp", "<cmd>bprevious<cr>", opts)

-- File Tree (Ex) --
map("n", "<leader>e", ":Ex<cr>", opts)

-- Visual mode tweaks --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Miscelanious --
-- Disable Ex mode
map("n", "Q", "<nop>", opts)

-- Fix Y
map("n", "Y", "y$", opts)

-- Keep things centered when moving
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Undo breakpoints
map("i", ",", ",<C-g>u", opts)
map("i", ".", ".<C-g>u", opts)
map("i", "!", "!<C-g>u", opts)
map("i", "?", "?<C-g>u", opts)
map("i", ">", "><C-g>u", opts)
map("i", "<", "<<C-g>u", opts)

-- Easier Movement
map("n", "H", "^", opts)
map("n", "L", "$", opts)
