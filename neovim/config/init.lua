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

-- Terminal-based Neovim ONLY
if not vim.g.vscode then

  require("bindings")
  require("functions")

end

