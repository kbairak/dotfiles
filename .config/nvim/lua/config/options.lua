-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- GPG agent doubles as SSH agent; ensure subprocesses (e.g. git via Lazy) inherit the socket.
vim.env.SSH_AUTH_SOCK = vim.env.SSH_AUTH_SOCK or vim.fn.expand("~/.gnupg/S.gpg-agent.ssh")
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 0
vim.opt.relativenumber = false
vim.opt.ignorecase = false
vim.opt.wrap = false
vim.opt.colorcolumn = "100"
vim.opt.spelllang = "en,el"
vim.g.snacks_animate = false
