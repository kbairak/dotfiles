return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "ruff",
        "black",
        "isort",
        "prettierd",
        "typescript-language-server",
        "postgrestools",
        "pgformatter",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix" },
        json = { "jq" },
        javascript = { "prettierd" },
      },
    },
  },
}
