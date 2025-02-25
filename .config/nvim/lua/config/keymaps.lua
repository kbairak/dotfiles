-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

vim.keymap.del("n", "<M-j>")
vim.keymap.del("n", "<M-k>")
vim.keymap.del("i", "<M-j>")
vim.keymap.del("i", "<M-k>")
vim.keymap.del("v", "<M-j>")
vim.keymap.del("v", "<M-k>")

vim.keymap.set("i", "∆", "<Esc><Cmd>m .+1<CR>==gi")
vim.keymap.set("n", "∆", "<Cmd>execute 'move .+' . v:count1<CR>==")
vim.keymap.set("v", "∆", ":<C-U>execute \"'<lt>,'>move '>+\" . v:count1<CR>gv=gv")
vim.keymap.set("i", "˚", "<Esc><Cmd>m .-2<CR>==gi")
vim.keymap.set("n", "˚", "<Cmd>execute 'move .-' . (v:count1 + 1)<CR>==")
vim.keymap.set("v", "˚", ":<C-U>execute \"'<lt>,'>move '<lt>-\" . (v:count1 + 1)<CR>gv=gv")

vim.keymap.set("n", "<Leader>A", ":%yank<cr>")

vim.keymap.set("n", "<Leader>r", "Pldebye")
vim.keymap.set("n", "<Leader>y", "byePa=<Esc>e")
