-- +--------------------------------------------------------------------------+
-- | INDENT-BLANKLINE                                                         |
-- +--------------------------------------------------------------------------+

-- https://github.com/lukas-reineke/indent-blankline.nvim

require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { "dashboard" },
})
