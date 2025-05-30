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

vim.keymap.set("n", "<Leader>R", "Pldebye")
vim.keymap.set("n", "<Leader>Y", "byei'<Esc>ea': <Esc>pe")
vim.keymap.set("n", "<Leader>y", "byePa=<Esc>e")
vim.keymap.set("n", "<Leader>'", "i<CR><Esc>ddpkkJxJx")

vim.keymap.set("n", "<Leader>=", ":FzfLua command_history<CR>=")
vim.keymap.set("n", "<Leader>;", ":FzfLua command_history<CR>")

vim.keymap.set("n", "<Leader>E", ":echo @%<CR>")

vim.api.nvim_create_user_command("RuffFix", function()
  --local bufname = vim.api.nvim_buf_get_name(0)
  local tmpfile = os.tmpname() .. ".py"

  -- Write current buffer to tmp file
  vim.fn.writefile(vim.api.nvim_buf_get_lines(0, 0, -1, false), tmpfile)

  -- Run ruff fix and format
  os.execute("ruff check --fix " .. tmpfile)
  os.execute("ruff format " .. tmpfile)

  -- Read the result back into the buffer
  local new_lines = vim.fn.readfile(tmpfile)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)

  -- Clean up
  os.remove(tmpfile)
end, {})
