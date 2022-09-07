-- THEME
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]       -- cmd:  Set the colorscheme

require('lualine').setup {
  options = {
    theme = 'catppuccin'
  }
}
