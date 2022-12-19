-- +--------------------------------------------------------------------------+
-- | GENERAL                                                                  |
-- +--------------------------------------------------------------------------+

vim.opt.mouse = "a" -- Enable mouse support in every mode.
vim.opt.undofile = true -- Save undo history after exiting.
vim.opt.updatetime = 100 -- Update swap file faster.
vim.opt.ttimeoutlen = 10 -- Less harsh delays on changing modes.

-- Use the '+' register as clipboard, which references the system clipboard.
-- Neovim is smart enough to detect and use 'wl-clipboard'.
vim.opt.clipboard = "unnamedplus"

-- Show whitespace as special characters.
vim.opt.list = true
vim.opt.listchars:append({
    tab = "»\\",
    extends = "›",
    precedes = "‹",
    nbsp = "·",
    trail = "·",
})
