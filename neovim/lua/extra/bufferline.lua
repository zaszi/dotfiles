-- +--------------------------------------------------------------------------+
-- | BUFFERLINE                                                               |
-- +--------------------------------------------------------------------------+

-- https://github.com/akinsho/bufferline.nvim

require("bufferline").setup({
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        separator_style = "slant",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
    },
    highlights = {
        fill = {
            fg = "#282828",
            bg = "#282828",
        },
        separator = {
            fg = "#282828",
            bg = "#282828",
        },
        separator_visible = {
            fg = "#282828",
            bg = "#282828",
        },
        separator_selected = {
            fg = "#282828",
            bg = "#282828",
        },
    },
})

map("n", "<C-n>", ":BufferLineCycleNext<CR>")
map("n", "<C-p>", ":BufferLineCyclePrev<CR>")
map("n", "<CS-n>", ":BufferLineMoveNext<CR>")
map("n", "<CS-p>", ":BufferLineMovePrev<CR>")
map("n", "<Leader>b", ":BufferLinePick<CR>")
