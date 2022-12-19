-- +--------------------------------------------------------------------------+
-- | KEYMAPPING                                                               |
-- +--------------------------------------------------------------------------+

-- Wrapper for mapping custom keybindings.
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap space as leader key.
map("n", " ", "", { noremap = true })
vim.g.mapleader = " "

-- Turn off linewise keys. This will make j and key navigate wrapped lines
-- on the screen as well, instead of skipping to the next actual line.
map("n", "j", "gj")
map("n", "k", "gk")

-- Easier split navigations.
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

-- Easily close a buffer but not the window.
map("n", "<Leader>d", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- Toggle spell checking.
map("n", "<Leader>s", ":setlocal spell! spell?<CR>")
