-- +--------------------------------------------------------------------------+
-- | NVIM-TREE                                                                |
-- +--------------------------------------------------------------------------+

-- https://github.com/kyazdani42/nvim-tree.lua

require("nvim-tree").setup({
    open_on_setup = true,
    open_on_setup_file = false,
    view = {
        adaptive_size = true,
    },
})

map("n", "<Leader>t", ":NvimTreeToggle<CR>")
