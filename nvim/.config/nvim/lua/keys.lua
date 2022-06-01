--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
-- map('i', 'jk', '<ESC>', {})

-- Vim Config
map('n', '<leader>ve', [[:edit $MYVIMRC<CR>]], {})
map('n', '<leader>vr', [[:source $MYVIMRC<CR>]], {})
map('n', '<leader>vi', [[:source $MYVIMRC<CR> :PackerInstall<CR>]], {})

-- Resize windows with Ctrl-Arrows
map('n', '<C-Up>', ':resize +2<CR>', {})
map('n', '<C-Down>', ':resize -2<CR>', {})
map('n', '<C-Left>', ':vertical resize -2<CR>', {})
map('n', '<C-Right>', ':vertical resize +2<CR>', {})

map('n', '<leader>e', [[:NvimTreeFindFileToggle<CR>]], {})
map('n', '<leader>l', [[:IndentLinesToggle<CR>]], {})
-- map('n', '<leader>t', [[:TagbarToggle<CR>]], {})

-- Telescope
map('n', '<leader>ff', [[:Telescope find_files<CR>]], {})
map('n', '<leader>fc', [[:Telescope current_buffer_fuzzy_find<CR>]], {})
map('n', '<leader>fg', [[:Telescope live_grep<CR>]], {})
map('n', '<leader>fb', [[:Telescope buffers<CR>]], {})
map('n', '<leader>fh', [[:Telescope find_help<CR>]], {})
-- map('n', '<leader>fm', [[:Telescope harpoon marks<CR>]], {})

-- Fugitive
map('n', '<leader>gs', ':Git<CR>', {})
