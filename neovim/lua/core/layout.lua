-- +--------------------------------------------------------------------------+
-- | LAYOUT                                                                   |
-- +--------------------------------------------------------------------------+

-- Set GUI font.
vim.o.guifont = "Iosevka NF"

vim.opt.title = true -- Set title instead of term inheritance.
vim.opt.number = true -- Enable line numbers.
vim.opt.signcolumn = "yes" -- Always show the sign column.
vim.opt.colorcolumn = "80" -- Display the textwidth visually.
vim.opt.showmode = false -- Our status line will show the mode instead.
vim.opt.splitbelow = true -- Have splits appear to the bottom by default.
vim.opt.splitright = true -- Have splits appear to the right by default.

-- Highlight blink on yank.
vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)
