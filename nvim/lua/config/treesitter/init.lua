require('nvim-treesitter.configs').setup {
  auto_install = true,

  -- Autopairing is wierd... could be conflicts with tpope/endwise
  autopairs = { enable = false },

  ensure_installed = {
    -- "bash",
    -- "c",
    -- "css",
    -- "diff",
    -- "dockerfile",
    -- "elixir",
    -- "eex",
    -- "erlang",
    -- "heex",
    -- "help",
    -- "html",
    -- "json",
    -- "javascript",
    -- "lua",
    -- "query",
    "ruby",
    -- "rust",
    -- "scss",
    -- "terraform",
    -- "typescript",
    -- "vim",
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- This just doesn't seem to work as well as the other default tools I've been using.
  indent = {
    enable = true
  },

  sync_install = false,
}
