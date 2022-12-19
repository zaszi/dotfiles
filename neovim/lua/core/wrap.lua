-- +--------------------------------------------------------------------------+
-- | WRAPPING                                                                 |
-- +--------------------------------------------------------------------------+

vim.opt.formatoptions = "croqjn1" -- Auto-wrap and insert comments, not text.
vim.opt.textwidth = 80 -- Wrap after 80 columns.
vim.opt.linebreak = true -- Break lines by words, not chars.
vim.opt.breakindent = true -- Wrapped lines continue indented.
vim.opt.breakindentopt = "sbr" -- Display a showbreak character after wrap.
vim.opt.showbreak = "↪ " -- Show unicode character as break.
