local wk = require("which-key")
wk.add({
  {

    --
    -- Execute
    --
    { "<leader>e", group = "Execute" },
    { "<leader>ee", '<cmd>TermExec cmd="cargo run %<cmd>."<cr>', desc = "Execute the current file (only supports Rust)" },
    { "<leader>et",
      '<cmd>TermExec cmd="ssio2via -x xslt/v2/ssio2via.xsl %<cmd>." direction=float name=ssio2via2<cr>',
      desc = "Transform current file" 
    },

    --
    -- Find
    --
    { "<leader>f", group = "Finding with Telescope" },
    { "<leader>f<leader>", "<cmd>Telescope live_grep<cr>", desc = "Grep (live)" },
    { "<leader>fB", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current open buffer" },
    { "<leader>fF", "<cmd>lua find_file_under_cursor()<cr>", desc = "Find files (under cursor)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Color Schemes" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (live)" },
    { "<leader>fg", "<cmd>Telescope grep_string<cr>", desc = "Grep (under cursor)" },
    { "<leader>fs", "<cmd>Telescope search_history<cr>", desc = "Search history" },

    --
    -- Git
    --
    { "<leader>g", group = "Git" },
    { "<leader>gb", "<cmd>Git blame_line<cr>", desc = "Show blame for this line" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Show the diff for this file" },
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazy git" },
    { "<leader>gh", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlighting" },

    --
    -- LSP Commands
    --
    { "<leader>l", group = "LSP Commands" },
    { "<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Goto declaration" },
    { "<leader>ld", "<Cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto definition" },
    { "<leader>ll", "<Cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },

    --
    -- NvimTree
    --
    { "<leader>n", group = "NvimTree File explorer" },
    { "<leader>nh", "<cmd>lua require('nvim-tree.api').tree.toggle_help()<cr>", desc = "Toggle help" },
    { "<leader>nn", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },

    --
    -- Testing
    --
    { "<leader>r", group = "Testing (vim-test and Neotest)" },
    { "<leader>rF", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run file" },
    { "<leader>rS", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle summary" },
    { "<leader>ra", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach test output" },
    { "<leader>rf", "<cmd>TestFile<cr>", desc = "Test file" },
    { "<leader>rn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test" },
    { "<leader>ro", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle test output" },
    { "<leader>rr", "<cmd>TestLast<cr>", desc = "Run last test" },
    { "<leader>rs", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>rt", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Re-run last test" },
    { "<leader>rv", "<cmd>TestVisit<cr>", desc = "Go to the test file" },

    --
    -- ToggleTerm
    --
    { "<leader>t", group = "ToggleTerm" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Switch to floating terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle the surrent open terminal" },

    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode

    { "<leader>B", "<cmd>bd!<cr>", desc = "Close!" }, -- no need to specify mode since it's inherited
    { "<leader>Q", "<cmd>wq<cr>", desc = "Save and Quit" },
    { "<leader>a", "<cmd>Telescope telescope-alternate alternate_file<cr>", desc = "Alternate file" },
    { "<leader>b", "<cmd>bd<cr>", desc = "Close" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, 
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },

  }
})
