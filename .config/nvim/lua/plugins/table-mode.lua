return {
  {
    "dhruvasagar/vim-table-mode",
    init = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_disable_mappings = "|"
      vim.g.table_mode_disable_tableize_mappings = "|"
    end,
  },
}
