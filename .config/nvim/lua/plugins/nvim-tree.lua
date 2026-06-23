return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = {
          width = {
            min = 30,
            max = -1,
            padding = 1,
          },
        },
      })
      vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")
    end,
    keys = { "<Leader>e" },
  },
}
