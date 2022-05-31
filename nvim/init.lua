--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.localleader = "\\"

-- PACKER
-- local fn = vim.fn
-- local install_path = '~/.config/nvim/site/pack/packer/start/packer.nvim'
-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
vim.cmd [[packadd packer.nvim]] -- packadd packer module

-- if fn.empty(fn.glob(install_path)) > 0 then
  -- packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

-- if packer_bootstrap then
 -- require('packer').sync()
  -- require(install_path).sync()
-- end

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- PLUGINS
vim.api.nvim_command('colorscheme dracula')       -- cmd:  Set the colorscheme
require('nvim-tree').setup{}
require('lualine').setup {
  options = {
    theme = 'dracula-nvim'
  }
}
require('nvim-autopairs').setup{}
