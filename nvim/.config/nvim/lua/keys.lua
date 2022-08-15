--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local nnoremap = require("keyset").nnoremap

-- remap the key used to leave insert mode
-- map('i', 'jk', '<ESC>', {})

-- Vim Config
map('n', '<leader>ve', [[:edit $MYVIMRC<CR>]], {})
map('n', '<leader>vr', [[:source $MYVIMRC<CR>]], {})
map('n', '<leader>vi', [[:source $MYVIMRC<CR> :PackerInstall<CR>]], {})
nnoremap('<leader>vs', '<CMD>PackerSync<CR>')

-- Resize windows with Ctrl-Arrows
map('n', '<C-Up>', ':resize +2<CR>', {})
map('n', '<C-Down>', ':resize -2<CR>', {})
map('n', '<C-Left>', ':vertical resize -2<CR>', {})
map('n', '<C-Right>', ':vertical resize +2<CR>', {})

map('n', '<leader>e', [[:NvimTreeFindFileToggle<CR>]], {})
map('n', '<leader>l', [[:IndentLinesToggle<CR>]], {})
-- map('n', '<leader>t', [[:TagbarToggle<CR>]], {})

-- LSP
nnoremap('<leader>h', vim.lsp.buf.hover, {buffer=0})
nnoremap('<leader>gd', vim.lsp.buf.definition, {buffer=0})
nnoremap('<leader>ne', vim.diagnostic.goto_next, {buffer=0})
nnoremap('<leader>pe', vim.diagnostic.goto_prev, {buffer=0})
nnoremap('<leader>r', vim.lsp.buf.rename, {buffer=0})
nnoremap('<leader>ca', vim.lsp.buf.code_action, {buffer=0})
nnoremap('<leader>fe', '<CMD>Telescope diagnostics<CR>', {buffer=0})

-- Telescope
map('n', '<leader>ff', [[:Telescope find_files hidden=true<CR>]], {})
map('n', '<leader>fc', [[:Telescope current_buffer_fuzzy_find<CR>]], {})
map('n', '<leader>fg', [[:Telescope live_grep<CR>]], {})
map('n', '<leader>fb', [[:Telescope buffers<CR>]], {})
map('n', '<leader>fh', [[:Telescope find_help<CR>]], {})
-- map('n', '<leader>fm', [[:Telescope harpoon marks<CR>]], {})
map('n', '<leader>fw', [[:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>]], {})

-- Fugitive
map('n', '<leader>gs', ':0Git<CR>', {})

-- Theme
map('n', '<leader>v1', ':Catppuccin mocha<cr>', {})
map('n', '<leader>v2', ':Catppuccin macchiato<cr>', {})
map('n', '<leader>v3', ':Catppuccin frappe<cr>', {})
map('n', '<leader>v4', ':Catppuccin latte<cr>', {})
