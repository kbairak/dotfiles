return {
  "kbairak/buffernotebook.nvim",
  build = ":UpdateRemotePlugins",
  cmd = "BufferNotebook", -- For lazy loading
  init = function()
    vim.keymap.set("n", "<Leader>bn", ":BufferNotebook toggle<CR>:set syntax=python<CR>:set shiftwidth=4<CR>")
    vim.keymap.set("n", "<Leader>bi", ":BufferNotebook inject<CR>")
    vim.keymap.set("n", "<Leader>bc", ":BufferNotebook copy<CR>")
  end,
  dir = "/Users/k.bairaktaris/code/prog/buffernotebook.nvim",
}
