--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local nnoremap = require("keyset").nnoremap

-- remap the key used to leave insert mode
-- map('i', 'jk', '<ESC>', {})

-- Vim Config
map('n', '<leader>ve', [[:edit $MYVIMRC<CR>]], {})
map('n', '<leader>vr', [[:source $MYVIMRC<CR>]], {})
map('n', '<leader>vi', [[:source $MYVIMRC<CR> :PackerInstall<CR>]], {})
nnoremap('<leader>vs', '<cmd>luafile %<CR>')

-- Resize windows with Ctrl-Arrows
map('n', '<C-Up>', ':resize +2<CR>', {})
map('n', '<C-Down>', ':resize -2<CR>', {})
map('n', '<C-Left>', ':vertical resize -2<CR>', {})
map('n', '<C-Right>', ':vertical resize +2<CR>', {})

map('n', '<leader>e', [[:NvimTreeFindFileToggle<CR>]], {})
map('n', '<leader>l', [[:IndentLinesToggle<CR>]], {})
-- map('n', '<leader>t', [[:TagbarToggle<CR>]], {})

-- LSP
-- hover
nnoremap('<F1>', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
nnoremap('K', vim.lsp.buf.hover, {buffer=0})

-- definitions, declarations, implementations
nnoremap('gd', vim.lsp.buf.definition, {buffer=0})
nnoremap('gr', vim.lsp.buf.references, {buffer=0})
nnoremap('<leader>cpd', '<cmd>Lspsaga preview_definition<CR>', { silent = true })

-- diagnostics
nnoremap('[D', vim.diagnostic.goto_next, {buffer=0})
nnoremap(']D', vim.diagnostic.goto_prev, {buffer=0})
nnoremap('[d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })
nnoremap(']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true })
nnoremap('<leader>cld>', '<cmd>Lspsaga show_line_diagnostics<CR>', { silent = true })
nnoremap('<leader>ccd>', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { silent = true })

-- rename
nnoremap('<leader>cr', vim.lsp.buf.rename, {buffer=0})
nnoremap('<F2>', '<cmd>Lspsaga rename<CR>', { silent = true })

-- code actions
-- nnoremap('<leader>ca', vim.lsp.buf.code_action, {buffer=0})
nnoremap('<leader>ca', '<cmd>Lspsaga code_action<CR>')
-- vnoremap('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', { silent = true })


nnoremap('<leader>cf>', '<cmd>Lspsaga lsp_finder<CR>')
nnoremap('<leader>co', '<cmd>LSoutlineToggle<CR>',{ silent = true })

-- local action = require("lspsaga.action")
-- -- scroll in hover doc or  definition preview window
-- vim.keymap.set("n", "<C-f>", function()
--     action.smart_scroll_with_saga(1)
-- end, { silent = true })
-- -- scroll in hover doc or  definition preview window
-- vim.keymap.set("n", "<C-b>", function()
--     action.smart_scroll_with_saga(-1)
-- end, { silent = true })

-- Telescope
map('n', '<leader>ff', [[:Telescope find_files hidden=true<CR>]], {})
map('n', '<leader>fc', [[:Telescope current_buffer_fuzzy_find<CR>]], {})
map('n', '<leader>fg', [[:Telescope live_grep<CR>]], {})
map('n', '<leader>fb', [[:Telescope buffers<CR>]], {})
map('n', '<leader>fh', [[:Telescope find_help<CR>]], {})
-- map('n', '<leader>fm', [[:Telescope harpoon marks<CR>]], {})
map('n', '<leader>fw', [[:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>]], {})
nnoremap('<leader>fe', '<cmd>Telescope diagnostics<CR>', {buffer=0})

-- Fugitive
map('n', '<leader>gs', ':0Git<CR>', {})

-- Theme
map('n', '<leader>v1', ':Catppuccin mocha<cr>', {})
map('n', '<leader>v2', ':Catppuccin macchiato<cr>', {})
map('n', '<leader>v3', ':Catppuccin frappe<cr>', {})
map('n', '<leader>v4', ':Catppuccin latte<cr>', {})
