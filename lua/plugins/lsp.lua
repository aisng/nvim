-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       ruby_lsp = {
--         mason = false,
--         cmd = { "mise", "x", "--", "ruby-lsp" },
--         filetypes = { "ruby" },
--         root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
--         settings = {},
--       },
--       rubocop = {
--         cmd = { "bundle", "exec", "rubocop", "--lsp" },
--         filetypes = { "ruby" },
--         root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
--       },
--     },
--     inlay_hints = { enabled = false },
--   },
-- }
-- local enabled_features = {
--   "documentSymbols",
--   "documentLink",
--   "hover",
--   "foldingRanges",
--   "selectionRanges",
--   -- "semanticHighlighting",
--   -- "formatting",
--   "onTypeFormatting",
--   -- "diagnostics",
--   "codeActions",
--   "documentHighlights",
--   "inlayHint",
--   "completion",
--   "codeLens",
--   "definition",
--   "workspaceSymbol",
--   "signatureHelp",
-- }
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = true },
    servers = {
      rubocop = {
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        filetypes = { "ruby" },
        root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
      },
      ruby_lsp = {
        cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp" },
        filetypes = { "ruby" },
        root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
        -- init_options = {
        --   enabledFeatures = enabled_features,
        -- },
        settings = {},
      },
    },
  },
}
