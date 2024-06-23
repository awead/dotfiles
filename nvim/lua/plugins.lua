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
    version = "*",
    config = build_with_config("toggleterm"),
  },

  -- -- Used for linting
  -- {
  --   "dense-analysis/ale",
  --   config = build_with_config("ale"),
  -- },

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
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = build_with_config("lazygit"),
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


  -- Documentation generator
  -- 
  -- Note: you need to run:
  -- :call doge#install()
  --
  {
    "kkoomen/vim-doge",
    config = function()
      vim.g["doge_doc_standard_python"] = "google"
    end
  },

  --
  -- Testing
  -- Using plain ol' vim-test because neotest seems to be a hot mess right now with treesitter
  --
  { 
    "vim-test/vim-test",
    config = function()
      vim.g["test#python#pytest#executable"] = "${LOCAL_PYTEST:-pytest}"
      vim.g["test#ruby#rspec#executable"] = "${LOCAL_RSPEC:-bundle exec rspec}"
      vim.g["test#strategy"] = "toggleterm"
      vim.g["test#neovim#term_position"] = "hor 25"
    end

  },

  --
  -- LSP for rust
  --
  
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = build_with_config("mason"),
  },

  {
    "neovim/nvim-lspconfig",
    config = build_with_config("lspconfig"),
  },

  {
    "simrat39/rust-tools.nvim",
    config = build_with_config("rust-tools"),
  },

  -- snippets
  {
    -- Completion framework:
    "hrsh7th/nvim-cmp",

    -- LSP completion source:
    "hrsh7th/cmp-nvim-lsp",

    -- Useful completion sources:
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/vim-vsnip"
  },

  --
  -- Pretty stuff...
  --
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = build_with_config("lualine"),
  },

  -- Telescope fuzzy finder and addons
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
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
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    build = ":TSUpdate",
    config = build_with_config("treesitter")
  },

  {
    'windwp/nvim-autopairs',
    config = build_with_config("autopairs")
  },
}
