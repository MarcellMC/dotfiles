--[[ annotated_keys.lua ]]

local wk = require("which-key")

local mappings = {
    c = {
        name = 'Code',
        {
            r = {
                '<cmd>Lspsaga rename<CR>',
                'Rename Tag'
            }
        }
    }
}

local opts = {
  prefix = '<leader>'
}
wk.register(mappings, opts)
