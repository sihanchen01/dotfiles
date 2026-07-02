-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- NightFox (Color Scheme)
    use 'EdenEast/nightfox.nvim'

    -- Tokoyo Night (Color Scheme)
    use 'folke/tokyonight.nvim'

    -- Folke/trouble
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    --  use("nvim-treesitter/playground")
    --  use("theprimeagen/harpoon")
    --  use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    --  use("nvim-treesitter/nvim-treesitter-context");

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'jose-elias-alvarez/null-ls.nvim',  requires = { 'nvim-lua/plenary.nvim' } },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    --  use("folke/zen-mode.nvim")
    --  use("github/copilot.vim")
    --  use("eandrju/cellular-automaton.nvim")
    --  use("laytan/cloak.nvim")

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        setup = function()
            local g = vim.g
            g.mkdp_auto_start = 0
            g.mkdp_auto_close = 1
            g.mkdp_page_title = "${name}.md"
            g.mkdp_theme = 'dark'
            g.mkdp_preview_options = {
                disable_sync_scroll = 0,
                disable_filename = 1,
            }
        end,
        ft = "markdown",
    })

    -- Easy Way to add Wrapper ("'[{}]'")
    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end
    }
end)
