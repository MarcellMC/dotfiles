--[[ annotated_keys.lua ]]

local wk = require("which-key")

local mappings = {
    c = {
        name = 'Code',
            r = {
                '<cmd>Lspsaga rename<CR>',
                'Rename Tag'
            }
    },
    v = {
        name = 'Vim',
        u = {
            '<cmd>UndotreeToggle<CR>',
            'Toggle Undo Tree'
        }
    }
}

local opts = {
  prefix = '<leader>'
}
wk.register(mappings, opts)
