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
  -- Git integration:
  -- { "tpope/vim-fugitive" },
  -- { "airblade/vim-gitgutter" },
  -- { "danchoi/ri.vim" },
  -- This does git diffs really nicely
  -- {
  --   "sindrets/diffview.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim"
  --   }
  -- }

  -- Basic stuff, including a few things I brought over from vim

  { "AndrewRadev/splitjoin.vim" },
  { "elixir-editors/vim-elixir" },
  { "hashivim/vim-terraform" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "machakann/vim-highlightedyank" },
  { "pangloss/vim-javascript" },
  { "vim-ruby/vim-ruby" },

  -- The Altar to Tim Pope

  { "tpope/vim-bundler" },
  { "tpope/vim-endwise" },
  { "tpope/vim-fugitive" },
  --{ "tpope/vim-projectionist" },
  { "tpope/vim-rails" },
  { "tpope/vim-rake" },
  { "tpope/vim-repeat" },
  { "tpope/vim-sensible" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
       require("toggleterm").setup()
    end
  },

  -- Used for linting
  {
    "dense-analysis/ale",
    config = build_with_config("ale"),
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = build_with_config("whichkey")
  },

  {
    "lewis6991/gitsigns.nvim",
    config = build_with_config("gitsigns"),
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = build_with_config("lualine"),
  },

  -- Neotest, including any language-specific packages as well as vim-test to cover the rest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-vim-test",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "vim-test/vim-test",
    },
    config = build_with_config("neotest"),
  },

  -- Telescope fuzzy finder and addons
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim"
    },
    cmd = "Telescope",
    config = build_with_config("telescope")
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" }
  },
  { "otavioschwanck/telescope-alternate" },

  -- NvimTree for file browsing
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = build_with_config("nvim-tree"),
    cmd = "NvimTreeToggle"
  },

  -- Devicons
  {
    "nvim-tree/nvim-web-devicons",
    config = build_with_config("icons")
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = build_with_config("treesitter")
  },
}