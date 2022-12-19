-- +--------------------------------------------------------------------------+
-- | TREESITTER                                                               |
-- +--------------------------------------------------------------------------+

-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup({
    -- List of parsers to pre-install.
    ensure_installed = {
        "rust",
        "bash",
        "lua",
        "html",
        "css",
        "yaml",
        "json",
        "toml",
    },
    -- Consistent syntax highlighting.
    highlight = {
        enable = true,
        disable = {},
    },
    -- Incremental selection based on the named nodes from the grammar.
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    -- Indentation based on treesitter for the `=` operator.
    indent = {
        enable = false,
        disable = {},
    },
})

-- Treesitter based folding.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
