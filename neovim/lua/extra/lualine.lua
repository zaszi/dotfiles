-- +--------------------------------------------------------------------------+
-- | LUALINE                                                                  |
-- +--------------------------------------------------------------------------+

-- https://github.com/nvim-lualine/lualine.nvim

local navic = require("nvim-navic")

require("lualine").setup({
    options = {
        theme = "gruvbox-material",
    },
    sections = {
        lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = navic.is_available,
            },
        },
    },
})
