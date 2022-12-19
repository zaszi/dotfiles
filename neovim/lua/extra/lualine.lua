-- +--------------------------------------------------------------------------+
-- | LUALINE                                                                  |
-- +--------------------------------------------------------------------------+

-- https://github.com/nvim-lualine/lualine.nvim

local gps = require("nvim-gps")
gps.setup()

require("lualine").setup({
    options = {
        theme = "gruvbox-material",
    },
    sections = {
        lualine_c = {
            { gps.get_location, cond = gps.is_available },
        },
    },
})
