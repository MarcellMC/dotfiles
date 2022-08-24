-- [[ plug.lua ]]

-- PACKER
-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--     packer_bootstrap = fn.system({'git',
--     'clone', '--depth',
--     '1',
--     'https://github.com/wbthomason/packer.nvim',
--     install_path})
-- end

return require('packer').startup(function(use)
    use ( 'wbthomason/packer.nvim' )

    -- [[ Which Key ]]
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
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
    use { 'ThePrimeagen/git-worktree.nvim' }

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

    -- [[ Dev ]]
    use { 'majutsushi/tagbar' }                        -- code structure
    use { 'Yggdroot/indentLine' }                      -- see indentation
    use { 'tpope/vim-fugitive' }                       -- git integration
    use { 'junegunn/gv.vim' }                          -- commit history
    use { 'windwp/nvim-autopairs' }                    -- auto-insert pairing symbols
    use { 'tpope/vim-commentary' }                     -- shortcuts for commenting code
    use { 'tpope/vim-surround' }                       -- surround with ease
    use { 'tpope/vim-repeat' }                         -- enhance vim's '.' (repeat last action)
    use { 'tpope/vim-speeddating' }                    -- advanced dates
    use { 'tpope/vim-eunuch' }                         -- sugar for the UNIX shell commands
    use { 'godlygeek/tabular' }                        -- easy alignment

    -- if packer_bootstrap then
    --     require('packer').sync()
    -- end
end)
