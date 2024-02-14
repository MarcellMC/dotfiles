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
            '<cmd>G commit<cr>',
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
        t = {
            name = 'Worktree',
            l = {
                "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
                'List Branches'
            },
            a = {
                "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
                'Add Worktree'
            }
        },
        w = {
            '<cmd>Gwrite<cr>',
            'Write to Git Index/Worktree'
        },
    },
    e = {
        name = 'Explore',
        f = {
            '<cmd>Oil<cr>',
            'File System'
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
            'Language Server Outline'
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
