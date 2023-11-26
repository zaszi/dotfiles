-- +--------------------------------------------------------------------------+
-- |  PLUGINS                                                                 |
-- +--------------------------------------------------------------------------+

-- https://github.com/wbthomason/packer.nvim

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require("packer").startup(function(use)
    -- Packer can manage itself.
    use("wbthomason/packer.nvim")

    -- Color scheme - extra/color.lua
    use("sainnhe/gruvbox-material")

    -- Language Server Protocol - extra/lspconfig.lua
    use({ "neovim/nvim-lspconfig" })

    -- Tree-Sitter - extra/treesitter.lua
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Format runner - extra/formatter.lua
    use("mhartington/formatter.nvim")

    -- Status line, icons and gps module - extra/lualine.lua
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "sainnhe/gruvbox-material",
            "kyazdani42/nvim-web-devicons",
            { "SmiteshP/nvim-navic", requires = { "nvim-treesitter/nvim-lspconfig" } },
        },
    })

    -- Completion engine and sources - extra/cmp.lua
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            { "onsails/lspkind-nvim", requires = { "neovim/nvim-lspconfig" } },
            { "hrsh7th/cmp-nvim-lsp", requires = { "neovim/nvim-lspconfig" } },
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
        },
    })

    -- Snippet engine and collection of snippets.
    use({ "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets" } })

    -- Git gutter symbols.
    use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

    -- Smooth scrolling - extra/neoscroll.lua.
    use("karb94/neoscroll.nvim")

    -- Auto pairing for multiple characters.
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    })

    -- Prettier pop-ups
    use({
        "hood/popui.nvim",
        requires = { "RishabhRD/popfix" },
    })

    -- Rust-specific extensions.
    use({
        "simrat39/rust-tools.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
    })

    -- Line peeking plugin.
    use({
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup({})
        end,
    })

    -- Markdown preview with glow.
    use({
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({
                border = "rounded",
            })
        end,
    })

    -- Enable builtin spellchecker for buffers with tree-sitter highlighting.
    use({
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
    })

    -- Project tree.
    use({ "kyazdani42/nvim-tree.lua", require = { "kyazdani42/nvim-web-devicons" } })

    -- Easily comment text in and out.
    use("b3nj5m1n/kommentary")

    -- Indentation guides - extra/indent-blankline.lua
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end,
    })

    -- Keybinding help popup - extra/which-key.lua
    use("folke/which-key.nvim")

    -- A bufferline with minimal tab integration - extra/bufferline.lua
    use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
