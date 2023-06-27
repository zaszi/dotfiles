-- +--------------------------------------------------------------------------+
-- | NVIM-TREE                                                                |
-- +--------------------------------------------------------------------------+

-- https://github.com/kyazdani42/nvim-tree.lua

require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
})

local function open_nvim_tree(data)
    -- If the buffer is a directory.
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- Create a new, empty buffer.
    vim.cmd.enew()

    -- Wipe the directory buffer.
    vim.cmd.bw(data.buf)

    -- Change to the directory.
    vim.cmd.cd(data.file)

    -- Open the tree.
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

map("n", "<Leader>t", ":NvimTreeToggle<CR>")
