function find_file_under_cursor ()
  local current_word = vim.fn.expand('<cword>')
  local snaked_word = snake(current_word)

  local opts = {
    search_file = snake(current_word)
  }
  print("snaked word: " .. snaked_word)
  require('telescope.builtin').find_files(opts)
end

-- Bug: V2StrategyPolicy becomes v_2_strategy_policy
function snake(s)return s:gsub('%f[^%l]%u','_%1'):gsub('%f[^%a]%d','_%1'):gsub('%f[^%d]%a','_%1'):gsub('(%u)(%u%l)','%1_%2'):lower()end

