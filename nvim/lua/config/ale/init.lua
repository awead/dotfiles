vim.g.ale_sign_column_always = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = "✗"
vim.g.ale_sign_warning = ""
vim.g.ale_fixers = {
  ["*"] =   { "remove_trailing_lines", "trim_whitespace" },
  rust = { "rustfmt" }
}
