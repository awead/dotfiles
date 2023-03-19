local wk = require("which-key")

local mappings = {
  a = { ":Telescope telescope-alternate alternate_file<cr>", "Alternate file" },
  q = { ":qa<CR>", "Quit" },
  Q = { ":wq<CR>", "Save and Quit" },
  w = { ":w<CR>", "Save" },
  x = { ":bdelete<CR>", "Close" },
  X = { ":bdelete!<CR>", "Close!" },

  f = {
    name = "Finding with Telescope",

    b = { ":Telescope buffers<cr>", "Buffers" },
    c = { ":Telescope colorscheme<cr>", "Color Schemes" },
    f = { ":Telescope find_files<cr>", "Files" },
    g = { ":Telescope grep_string<cr>", "Grep (under cursor)" },
    ["<leader>"] = { ":Telescope live_grep<cr>", "Grep (live)" },
  },

  g = {
    name = "Git",

    d = { ":Gitsigns diffthis<cr>", "Show the diff for this file" },
    -- f = { ":DiffviewFileHistory<cr>", "View file history" },
    g = { ":Git<cr>", "Current git status" },
    h = { ":Gitsigns toggle_linehl<cr>", "Toggle line highlighting" },
    -- ["<leader>"] = { ":DiffviewClose<cr>", "Close the current git panel" },
  },

  l = {
    name = "Linting with Ale",

    d = { ":ALEGoToDefinition<cr>", "Goto definition" },
    f = { ":ALEFindReferences<cr>", "Find references" },
    n = { ":ALENext", "Next error<cr>" },
    p = { ":ALEPrevious<cr>", "Previous error" },

  },

  n = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },

  r = {
    name = "Testing (using vim-test because I'm still evaluating Neotest)",

    f = { ":TestFile<cr>", "Test file" },
    r = { ":TestLast<cr>", "Run last test" },
    s = { ":TestNearest<cr>", "Run nearest test" },
    v = { ":TestVisit<cr>", "Go to the test file" },
  },

  t = {
    name = "Testing (using Neotest)",

    a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach test output" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run file" },
    n = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest test" },
    o = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Toggle test output" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle summary" },
  },

  T = {
    name = "ToggleTerm",

    t = { ":ToggleTerm<cr>", "Open a new terminal" },
  }

}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
