-- Neovim config

-- Define the leader before installing plugins
vim.g.mapleader = " "

-- There apparently need to be invoked before the ale plugin is loaded
vim.o.omnifunc = "ale#completion#OmniFunc"
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_autoimport = 1

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
require("lazy").setup("plugins")
require("options")
require("bindings")
