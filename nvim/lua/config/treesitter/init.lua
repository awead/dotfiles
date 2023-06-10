require('nvim-treesitter.configs').setup {
  auto_install = true,

  -- Autopairing is wierd... could be conflicts with tpope/endwise
  autopairs = { enable = true },

  ensure_installed = {
    "bash",
    -- "c",
    -- "css",
    -- "diff",
    "dockerfile",
    -- "elixir",
    -- "eex",
    -- "erlang",
    -- "heex",
    -- "help",
    "html",
    "json",
    "javascript",
    -- "lua",
    -- "query",
    "ruby",    -- disabled in favor of tpope plugins
    -- "rust",
    "scss",
    "sql",
    -- "terraform",
    -- "typescript",
    -- "vim",
  },

  -- setting to false will disable the whole extensios
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Seems very buggy with Ruby so I'm leaving this off
  indent = {
    enable = true
  },

  sync_install = false,
}
