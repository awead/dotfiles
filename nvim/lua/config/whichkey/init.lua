local wk = require("which-key")

local mappings = {
  a = { ":Telescope telescope-alternate alternate_file<cr>", "Alternate file" },
  b = { ":bd<CR>", "Close" },
  B = { ":bd!<CR>", "Close!" },
  q = { ":qa<CR>", "Quit" },
  Q = { ":wq<CR>", "Save and Quit" },
  w = { ":w<CR>", "Save" },

  f = {
    name = "Finding with Telescope",

    b = { ":Telescope buffers<cr>", "Buffers" },
    B = { ":Telescope current_buffer_fuzzy_find<cr>", "Current open buffer" },
    c = { ":Telescope colorscheme<cr>", "Color Schemes" },
    f = { ":Telescope find_files<cr>", "Files" },
    g = { ":Telescope grep_string<cr>", "Grep (under cursor)" },
    s = { ":Telescope search_history<cr>", "Search history" },
    ["<leader>"] = { ":Telescope live_grep<cr>", "Grep (live)" },
  },

  g = {
    name = "Git",

    b = { ":Git blame<cr>", "Toggle git blame" },
    d = { ":Gitsigns diffthis<cr>", "Show the diff for this file" },
    -- f = { ":DiffviewFileHistory<cr>", "View file history" },
    g = { ":Git<cr>", "Current git status" },
    h = { ":Gitsigns toggle_linehl<cr>", "Toggle line highlighting" },
    -- ["<leader>"] = { ":DiffviewClose<cr>", "Close the current git panel" },
  },

  l = {
    name = "LSP Commands",

    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
    l = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },

  },

  n = {
    name = "NvimTree File explorer",

    h = { "<cmd>lua require('nvim-tree.api').tree.toggle_help()<cr>", "Toggle help" },
    n = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
  },

  r = {
    name = "Testing (vim-test and Neotest)",

    R = { ":let test#ruby#rspec#executable = 'bundle exec rspec'<CR>", "Use bundle rspec for testing" },
    a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach test output" },
    f = { ":TestFile<cr>", "Test file" },
    F = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run file" },
    k = { ":let test#ruby#rspec#executable = 'script/tilt/rspec'<CR>", "Run tests inside Kat" },
    n = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest test" },
    o = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Toggle test output" },
    r = { ":TestLast<cr>", "Run last test" },
    s = { ":TestNearest<cr>", "Run nearest test" },
    S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle summary" },
    t = { "<cmd>lua require('neotest').run.run_last()<cr>", "Re-run last test" },
    v = { ":TestVisit<cr>", "Go to the test file" },

  },

  t = {
    name = "ToggleTerm",

    f = { ":ToggleTerm direction=float<cr>", "Switch to floating terminal" },
    t = { ":ToggleTerm<cr>", "Toggle the surrent open terminal" },
  }

}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
