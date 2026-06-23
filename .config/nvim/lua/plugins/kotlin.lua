return {
  -- Disable fwcd/kotlin-language-server: it bundles Kotlin 2.1.0 which cannot
  -- read Kotlin 2.3.x metadata (com.plum.common.shared and others are compiled
  -- with 2.3.x). The CLASSPATH is hardcoded in its startup script; KOTLIN_HOME
  -- has no effect.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          enabled = false,
        },
      },
    },
  },
  -- JetBrains' official kotlin-lsp — supports Kotlin 2.3.x natively.
  -- Install the server with :MasonInstall kotlin-lsp (includes a bundled JRE).
  {
    "AlexandrosAlexiou/kotlin.nvim",
    ft = { "kotlin" },
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      require("kotlin").setup {
        root_markers = { "gradlew", ".git", "mvnw", "settings.gradle" },
        jvm_args = { "-Xmx4g" },
        inlay_hints = { enabled = true },
      }
    end,
  },
}