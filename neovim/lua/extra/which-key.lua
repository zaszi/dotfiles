-- +--------------------------------------------------------------------------+
-- | WHICH-KEY                                                                |
-- +--------------------------------------------------------------------------+

-- https://github.com/folke/which-key.nvim

require("which-key").setup({
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 10,
        },
    },
    window = {
        border = "single",
    },
})

-- Add labels for all custom keybinds.
require("which-key").register({
    ["<leader>"] = {
        b = { "Pick buffer" },
        d = { "Close buffer" },
        s = { "Toggle spellcheck" },
        t = { "Toggle project tree" },
    },
    ["g"] = {
        ["?"] = { "Toggle nvim-tree help" },
    },
})
