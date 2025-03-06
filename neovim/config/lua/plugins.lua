build_with_config = function(package_name)
  return function()
    require("config." .. package_name)
  end
end

return {

  -- TODO: Plugins I'm considering
  --------------------------------
  -- { "akinsho/bufferline.nvim" },
  -- { "bcicen/vim-jfmt" },
  -- { "airblade/vim-gitgutter" },
  -- { "danchoi/ri.vim" },
  -- This does git diffs really nicely
  -- {
  --   "sindrets/diffview.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim"
  --   }
  -- }

  -- Things that don't work
  -------------------------
  --  { "vim-ruby/vim-ruby" }, -- seems to conflict with treesitter

  -- Basic stuff, including a few things I brought over from vim
  --------------------------------------------------------------
  -- { "AndrewRadev/splitjoin.vim" },
  -- { "elixir-editors/vim-elixir" },
  -- { "hashivim/vim-terraform" },
  -- { "lukas-reineke/indent-blankline.nvim" },
  { "machakann/vim-highlightedyank" },
  -- { "pangloss/vim-javascript"  ,

  -- The Altar to Tim Pope
  -------------------------
  { "tpope/vim-abolish" },
  -- { "tpope/vim-bundler" },
  -- { "tpope/vim-endwise" },
  -- { "tpope/vim-fugitive" },
  -- { "tpope/vim-projectionist" },
  -- { "tpope/vim-rails" },
  -- { "tpope/vim-rake" },
  -- { "tpope/vim-repeat" },
  -- { "tpope/vim-sensible" },
  { "tpope/vim-surround" },
  -- { "tpope/vim-unimpaired" },

  {
    "akinsho/toggleterm.nvim",
    cond = not vim.g.vscode,
    version = "*",
    config = build_with_config("toggleterm"),
  },

  {
    "folke/tokyonight.nvim",
    cond = not vim.g.vscode,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  {
    "folke/which-key.nvim",
    cond = not vim.g.vscode,
    event = "BufWinEnter",
    config = build_with_config("whichkey")
  },

  {
    "kdheepak/lazygit.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    config = build_with_config("gitsigns"),
  },

  {
    "numToStr/Comment.nvim",
    cond = not vim.g.vscode,
    config = function()
      require('Comment').setup()
    end
  },

  {
    'windwp/nvim-autopairs',
    config = build_with_config("autopairs")
  },

  -- Pretty stuff...
  {
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = build_with_config("lualine"),
  },

  -- Neotest, including any language-specific packages as well as vim-test to cover the rest
  {
    "nvim-neotest/neotest",
    cond = not vim.g.vscode,
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "vim-test/vim-test",
    },
    config = build_with_config("neotest"),
  },

  -- Telescope fuzzy finder and addons
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim"
    },
    cmd = "Telescope",
    config = build_with_config("telescope")
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    cond = not vim.g.vscode,
    dependencies = { "kkharji/sqlite.lua" }
  },
  { 
    "otavioschwanck/telescope-alternate",
    cond = not vim.g.vscode,
  },

  -- NvimTree for file browsing
  {
    "nvim-tree/nvim-tree.lua",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = build_with_config("nvim-tree"),
    cmd = "NvimTreeToggle"
  },

  -- Devicons
  {
    "nvim-tree/nvim-web-devicons",
    cond = not vim.g.vscode,
    config = build_with_config("icons")
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    build = ":TSUpdate",
    config = build_with_config("treesitter")
  },
}
