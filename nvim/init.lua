-- Define the leader before installing plugins
vim.g.mapleader = " "

-- Configure lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- These will load plugins for terminal Neovim, VSCode+Neovim, or both
require("lazy").setup("plugins")
require("options")

if vim.g.vscode then

  -- VSCode+Neovim ONLY
  vim.cmd[[source $HOME/.config/nvim/vscode/settings.vim]]

else

  -- Terminal-based Neovim ONLY
  require("bindings")
  require("functions")

end

