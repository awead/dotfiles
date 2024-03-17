function find_file_under_cursor ()
  local current_word = vim.call('expand','<cword>')

  local opts = {
    search_file = snake(current_word)
  }
  require('telescope.builtin').find_files(opts)
end

function snake(s)return s:gsub('%f[^%l]%u','_%1'):gsub('%f[^%a]%d','_%1'):gsub('%f[^%d]%a','_%1'):gsub('(%u)(%u%l)','%1_%2'):lower()end

