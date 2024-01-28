require("neotest").setup({
  adapters = {
    -- Won't let you run the test inside a docker container
    --require("neotest-elixir")({
      --mix_task = {"dc run test mix test"},
    --}),
    require("neotest-rspec"),
    require("neotest-vim-test")({ ignore_filetypes = { "ruby" } }),
  }

})

-- Configure vim-test, which neo-test will use under the hood
vim.g["test#elixir#exunit#executable"] = "docker-compose run test mix test --trace"
vim.g["test#ruby#rspec#executable"] = "bin/d-rspec"
vim.g["test#strategy"] = "toggleterm"
vim.g["test#neovim#term_position"] = "hor 25"
