require('nvim-treesitter.configs').setup {
  auto_install = true,
  autopairs = { enable = true },
  ensure_installed = { 
    "bash",
    "c", 
    "elixir",
    "erlang",
    "help", 
    "json",
    "javascript",
    "lua", 
    "query", 
    "ruby",
    "rust",
    "typescript",
    "vim", 
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },

  sync_install = false,
}
