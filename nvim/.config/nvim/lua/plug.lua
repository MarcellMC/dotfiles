-- [[ plug.lua ]]

return require('lazy').setup({
    -- [[ Which Key ]]
        "folke/which-key.nvim",

    -- [[ UndoTree ]]
        'mbbill/undotree',

    -- [[ TreeSitter ]]
        'nvim-treesitter/nvim-treesitter',           -- syntax tree builder
        -- run = ':TSUpdate'
    -- use 'nvim-treesitter/playground'

    -- [[ LSP ]]
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

    -- [[ Completion ]]
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',

    -- [[ Tree ]]
   {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
    },

    -- [[ Telescope ]]
    {
        'nvim-telescope/telescope.nvim',                 -- fuzzy finder
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    -- [[ Theme ]]
    'mhinz/vim-startify',                      -- start screen
    'DanilaMihailov/beacon.nvim',               -- cursor jump
    {
        'nvim-lualine/lualine.nvim',                     -- statusline
        dependencies = {'kyazdani42/nvim-web-devicons',
        lazy = true}
    },
    {
        "catppuccin/nvim",                               -- catpuccin theme
        name = "catppuccin"
    },

    -- [[ Git ]]
    'tpope/vim-fugitive',                       -- git integration
    'idanarye/vim-merginal',                       -- git integration
    'rbong/vim-flog',                           -- git branch viewer
    'ThePrimeagen/git-worktree.nvim',           -- git worktree integration
    -- {
    --     'lewis6991/gitsigns.nvim',
    --     version = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    -- },

    -- [[ Dev ]]
    'majutsushi/tagbar',                        -- code structure
    'Yggdroot/indentLine',                      -- see indentation
    'junegunn/gv.vim',                          -- commit history
    'windwp/nvim-autopairs',                    -- auto-insert pairing symbols
    'tpope/vim-commentary',                     -- shortcuts for commenting code
    'tpope/vim-surround',                       -- surround with ease
    'tpope/vim-repeat',                         -- enhance vim's '.' (repeat last action)
    'tpope/vim-speeddating',                    -- advanced dates
    'tpope/vim-eunuch',                         -- sugar for the UNIX shell commands
    'godlygeek/tabular',                        -- easy alignment

    -- [[ Markdown ]]
    'epwalsh/obsidian.nvim' })
