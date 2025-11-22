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

local last_non_terminal_win = nil

local function toggle_rightmost_terminal()
  local current_win = vim.api.nvim_get_current_win()
  local all_wins = vim.api.nvim_tabpage_list_wins(0)

  -- Find rightmost non-floating window
  local rightmost_win, max_col = nil, -1
  for _, win in ipairs(all_wins) do
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative == "" then
      local pos = vim.api.nvim_win_get_position(win)
      if pos[2] > max_col then
        max_col = pos[2]
        rightmost_win = win
      end
    end
  end

  if not rightmost_win then
    vim.notify("No suitable window found", vim.log.levels.WARN)
    return
  end

  local rightmost_buf = vim.api.nvim_win_get_buf(rightmost_win)
  local is_terminal = vim.bo[rightmost_buf].buftype == "terminal"
  local current_mode = vim.api.nvim_get_mode().mode

  if not is_terminal then
    last_non_terminal_win = current_win
    -- Open new rightmost terminal
    vim.cmd("vsplit")
    vim.cmd("wincmd L")
    vim.cmd("terminal")
    vim.cmd("startinsert")
  elseif rightmost_win ~= current_win then
    last_non_terminal_win = current_win
    -- Focus rightmost terminal and enter insert mode
    vim.api.nvim_set_current_win(rightmost_win)
    vim.cmd("startinsert")
  elseif current_mode == "t" then
    -- Exit insert mode in terminal
    vim.cmd("stopinsert")
    if last_non_terminal_win then
      vim.api.nvim_set_current_win(last_non_terminal_win)
      last_non_terminal_win = nil
    end
  else
    last_non_terminal_win = current_win
    -- Enter insert mode in terminal
    vim.cmd("startinsert")
  end
end

vim.keymap.set({ "n", "i", "v", "t" }, "<C-/>", toggle_rightmost_terminal, { silent = true })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-\\>", "<C-\\><C-n>", { silent = true })

-- Navigate to next/previous file in directory
local function get_files_in_dir(dir)
  local files = {}
  local handle = vim.loop.fs_scandir(dir)
  if handle then
    while true do
      local name, type = vim.loop.fs_scandir_next(handle)
      if not name then
        break
      end
      if type == "file" then
        table.insert(files, name)
      end
    end
  end
  table.sort(files)
  return files
end

local function navigate_sibling_file(direction)
  local current_file = vim.fn.expand("%:p")
  if current_file == "" then
    vim.notify("No file in current buffer", vim.log.levels.WARN)
    return
  end

  local dir = vim.fn.fnamemodify(current_file, ":h")
  local filename = vim.fn.fnamemodify(current_file, ":t")
  local files = get_files_in_dir(dir)

  if #files == 0 then
    vim.notify("No files found in directory", vim.log.levels.WARN)
    return
  end

  -- Find current file index
  local current_idx = nil
  for i, f in ipairs(files) do
    if f == filename then
      current_idx = i
      break
    end
  end

  if not current_idx then
    vim.notify("Current file not found in directory list", vim.log.levels.WARN)
    return
  end

  -- Calculate next index with wrap-around
  local next_idx
  if direction == "next" then
    next_idx = current_idx % #files + 1
  else
    next_idx = (current_idx - 2) % #files + 1
  end

  local next_file = dir .. "/" .. files[next_idx]
  vim.cmd("edit " .. vim.fn.fnameescape(next_file))
end

vim.keymap.set("n", "<Leader>]", function()
  navigate_sibling_file("next")
end, { desc = "Next file in directory" })

vim.keymap.set("n", "<Leader>[", function()
  navigate_sibling_file("prev")
end, { desc = "Previous file in directory" })
