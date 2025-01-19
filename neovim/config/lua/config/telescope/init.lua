require("telescope").setup{
  defaults = {
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
    color_devicons = true,
    entry_prefix = "  ",
    file_ignore_patterns = {},
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    initial_mode = "insert",
    layout_config = {
      horizontal = { mirror = false },
      preview_cutoff = 120,
      prompt_position = "top",
      vertical = { mirror = false },
      width = 0.75
    },
    layout_strategy = "horizontal",
    path_display = {},
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    selection_strategy = "reset",
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    sorting_strategy = "ascending",
    use_less = true,
    winblend = 0,
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    path_display = {},
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  -- pickers = {
  --   find_files = {
  --     find_command = { "rg", "--vimgrep", "--no-heading" },
  --     hidden = true,
  --     no_ignore = false,
  --     no_ignore_parent = false
  --   }
  -- },
  extensions = {
    frecency = {
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/.elixir_ls/*" }
    },
    file_browser = {
      hijack_netrw = true,
      theme = "ivy",
      mappings = {
        [ "i" ] = {
        },
        [ "n" ] = {
        }
      }
    },
    ["telescope-alternate"] = {
      mappings = {
        { 'lib/(.*).ex', { { 'test/[1]_test.exs', 'Test' } } },
        { 'test/(.*)_test.exs', { { 'lib/[1].ex', 'Original', true } } },
        { 'lib/(.*).rb', { { 'spec/lib/[1]_spec.rb', 'Test' } } },
        { 'spec/lib/(.*)_spec.rb', { { 'lib/[1].rb', 'Original', true } } },
      },
      presets = { "rails", "rspec", "nestjs" }
    },
  }
}
require "telescope".load_extension("frecency")
require "telescope".load_extension("telescope-alternate")

-- Maybe don't use this? NvimTree seems to cover this
require "telescope".load_extension("file_browser")

require("telescope").load_extension("lazygit")
-- not sure about this one....
--require("telescope").extensions.lazygit.lazygit()

