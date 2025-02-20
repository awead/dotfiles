require("neotest").setup({
  adapters = {
    require("neotest-rspec"),
    require("neotest-vim-test")({ ignore_filetypes = { "ruby" } }),
  }
})

-- Configure vim-test, which neo-test will use under the hood
vim.g["test#elixir#exunit#executable"] = "k-mix-test"
vim.g["test#ruby#rspec#executable"] = "k-rspec"
vim.g["test#python#pytest#executable"] = "k-pytest"
vim.g["test#strategy"] = "toggleterm"
vim.g["test#neovim#term_position"] = "hor 25"
