return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>ss",
      function()
        -- Check if any LSP client supports document symbols
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local has_document_symbols = false

        for _, client in ipairs(clients) do
          if client.server_capabilities.documentSymbolProvider then
            has_document_symbols = true
            break
          end
        end

        if has_document_symbols then
          -- LSP with document symbols is available
          require("fzf-lua").lsp_document_symbols()
        else
          -- No LSP with document symbols, fallback to ctags
          require("fzf-lua").btags()
        end
      end,
      desc = "Document Symbols (LSP or ctags)",
    },
  },
}
