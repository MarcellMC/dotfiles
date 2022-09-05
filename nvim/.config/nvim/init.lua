--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.localleader = "\\"

-- IMPORTS
require('plug')      -- Plugins
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('annotated_keys')
require('user.telescope')
require('user.lsp')

-- PLUGINS
-- require('nvim-lsp-installer').setup {}
require('nvim-tree').setup{}
require('lualine').setup {
  options = {
    theme = 'catppuccin'
  }
}
require('nvim-autopairs').setup{}
