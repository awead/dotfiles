function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader><leader>', '<c-^>', { desc = 'Switch to previous file' })

-- Move around splits like you do normal navigation
map('n', '<C-J>', '<C-W>j', { desc = 'Move down to split' })
map('n', '<C-K>', '<C-W>k', { desc = 'Move up to split' })
map('n', '<C-L>', '<C-W>l', { desc = 'Move right to split' })
map('n', '<C-H>', '<C-W>h', { desc = 'Move left to split' })

-- Move splits the option-key equivalents of the standard vim home keys
map('n', '∆', '<C-W>J', { desc = 'Move the split down' })
map('n', '˚', '<C-W>K', { desc = 'move the split up' })
map('n', '¬', '<C-W>L', { desc = 'Move the split right' })
map('n', '˙', '<C-W>H', { desc = 'Move the split left' })

-- Maps arrow keys to resize windows
map('n', '<leader><Left>', ':vertical resize -5<CR>', { desc = 'Resize left' })
map('n', '<leader><Right>', ':vertical resize +5<CR>', { desc = 'Resize right' })
map('n', '<leader><Up>', ':resize -5<CR>', { desc = 'Resize up' })
map('n', '<leader><Down>', ':resize +5<CR>', { desc = 'Resize down' })

-- ToggleTerm
map('t', '<Escape>', '<C-Bslash><C-n>', { desc = 'ToggleTerm: Exit insert mode' })

-- Spelling
map('n', '<leader>s', 'z=', { desc = 'Suggest spelling correction' })
