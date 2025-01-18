local wk = require("which-key")

wk.add({
  {

    { "<leader>a", "<cmd>Telescope telescope-alternate alternate_file<cr>", desc = "Alternate file" },
    { "<leader>B", "<cmd>bd!<cr>", desc = "Close!" }, -- no need to specify mode since it's inherited
    { "<leader>b", "<cmd>bd<cr>", desc = "Close" },
    { "<leader>Q", "<cmd>wq<cr>", desc = "Save and Quit" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, 
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },

    ---
    --- Telescope
    ---
    { "<leader>f", group = "Finding with Telescope" },
    { "<leader>f<leader>", ":Telescope live_grep<cr>", desc = "Grep (live)" },
    { "<leader>fB", ":Telescope current_buffer_fuzzy_find<cr>", desc = "Current open buffer" },
    { "<leader>fF", ":lua find_file_under_cursor()<CR>", desc = "Find files (under cursor)" },
    { "<leader>fb", ":Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fc", ":Telescope colorscheme<cr>", desc = "Color Schemes" },
    { "<leader>ff", ":Telescope find_files<cr>", desc = "Find files (live)" },
    { "<leader>fg", ":Telescope grep_string<cr>", desc = "Grep (under cursor)" },
    { "<leader>fs", ":Telescope search_history<cr>", desc = "Search history" },

    ---
    --- Git
    ---
    { "<leader>g", group = "Git" },
    { "<leader>gb", ":Git blame_line<cr>", desc = "Show blame for this line" },
    { "<leader>gd", ":Gitsigns diffthis<cr>", desc = "Show the diff for this file" },
    { "<leader>gg", ":LazyGit<cr>", desc = "Lazy git" },
    { "<leader>gh", ":Gitsigns toggle_linehl<cr>", desc = "Toggle line highlighting" },

    ---
    --- NvimTree
    ---
    { "<leader>n", group = "NvimTree File explorer" },
    { "<leader>nh", "<cmd>lua require('nvim-tree.api').tree.toggle_help()<cr>", desc = "Toggle help" },
    { "<leader>nn", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },

    ---
    --- Testing: RSpec and Neotest
    ---
    { "<leader>r", group = "Testing (vim-test and Neotest)" },
    { "<leader>rF", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run file" },
    { "<leader>rR", ":let test#ruby#rspec#executable = 'bundle exec rspec'<CR>", desc = "Use bundle rspec for testing" },
    { "<leader>rS", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle summary" },
    { "<leader>ra", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach test output" },
    { "<leader>rf", ":TestFile<cr>", desc = "Test file" },
    { "<leader>rk", ":let test#ruby#rspec#executable = 'script/tilt/rspec'<CR>", desc = "Run tests inside Kat" },
    { "<leader>rn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test" },
    { "<leader>ro", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle test output" },
    { "<leader>rr", ":TestLast<cr>", desc = "Run last test" },
    { "<leader>rs", ":TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>rt", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Re-run last test" },
    { "<leader>rv", ":TestVisit<cr>", desc = "Go to the test file" },

    ---
    --- ToggleTerm
    ---
    { "<leader>t", group = "ToggleTerm" },
    { "<leader>tf", ":ToggleTerm direction=float<cr>", desc = "Switch to floating terminal" },
    { "<leader>tt", ":ToggleTerm<cr>", desc = "Toggle the surrent open terminal" },

  }
})




