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
    g = {
        name = 'Git',
        c = {
            '<cmd>Gwrite<cr>',
            'Commit'
        },
        p = {
            l = {
                '<cmd>G pull<CR>',
                'Git Pull'
            },
            s = {
                '<cmd>G push<CR>',
                'Git Push'
            }
        },
        r = {
            '<cmd>Gread<cr>',
            'Read from Git Index/Worktree'
        },
        s = {
            '<cmd>tabe | 0Git<CR>',
            'Status in a New Tab'
        },
        w = {
            '<cmd>Gwrite<cr>',
            'Write to Git Index/Worktree'
        },
    },
    t = {
        name = 'Toggle',
        f = {
            '<cmd>NvimTreeFindFileToggle<CR>',
            'File Tree'
        },
        i = {
            '<cmd>IndentLinesToggle<CR>',
            'Indent Lines'
        },
        o = {
            '<cmd>LSoutlineToggle<CR>',
            'Indent Lines'
        },
        u = {
            '<cmd>UndotreeToggle<CR>',
            'Undo Tree'
        },
    },
    w = {
        '<C-w>',
        'Window'
    },
}

local opts = {
    prefix = '<leader>'
}
wk.register(mappings, opts)
