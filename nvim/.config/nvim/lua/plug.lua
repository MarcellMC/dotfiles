-- [[ plug.lua ]]

return require('packer').startup(function(use)
    use ( 'wbthomason/packer.nvim' )

    -- [[ Which Key ]]
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end
    }

    -- [[ UndoTree ]]
    use {
        'mbbill/undotree'
    }

    -- [[ TreeSitter ]]
    use {
        'nvim-treesitter/nvim-treesitter',           -- syntax tree builder
        run = ':TSUpdate'
    }
    -- use 'nvim-treesitter/playground'

    -- [[ LSP ]]
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
})

    -- [[ Completion ]]
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path'
    }

    -- [[ Tree ]]
    use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
    }

    -- [[ Telescope ]]
    use {
        'nvim-telescope/telescope.nvim',                 -- fuzzy finder
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- [[ Theme ]]
    use { 'mhinz/vim-startify' }                       -- start screen
    use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
    use {
        'nvim-lualine/lualine.nvim',                     -- statusline
        requires = {'kyazdani42/nvim-web-devicons',
        opt = true}
    }
    use {
        "catppuccin/nvim",                               -- catpuccin theme
        as = "catppuccin"
    }

    -- [[ Git ]]
    use { 'tpope/vim-fugitive' }                       -- git integration
    use { 'idanarye/vim-merginal' }                       -- git integration
    use { 'rbong/vim-flog' }                           -- git branch viewer
    use { 'ThePrimeagen/git-worktree.nvim' }           -- git worktree integration
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- [[ Dev ]]
    use { 'majutsushi/tagbar' }                        -- code structure
    use { 'Yggdroot/indentLine' }                      -- see indentation
    use { 'junegunn/gv.vim' }                          -- commit history
    use { 'windwp/nvim-autopairs' }                    -- auto-insert pairing symbols
    use { 'tpope/vim-commentary' }                     -- shortcuts for commenting code
    use { 'tpope/vim-surround' }                       -- surround with ease
    use { 'tpope/vim-repeat' }                         -- enhance vim's '.' (repeat last action)
    use { 'tpope/vim-speeddating' }                    -- advanced dates
    use { 'tpope/vim-eunuch' }                         -- sugar for the UNIX shell commands
    use { 'godlygeek/tabular' }                        -- easy alignment
end)
