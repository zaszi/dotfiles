-- +--------------------------------------------------------------------------+
-- | COLOR                                                                    |
-- +--------------------------------------------------------------------------+

-- https://github.com/sainnhe/gruvbox-material

vim.opt.termguicolors = true -- Enable true colors.
vim.opt.background = "dark" -- Ensure neovim knows we use a dark background.

-- Color scheme specific settings.
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_disable_italic_comment = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_palette = "original"
vim.cmd("colorscheme gruvbox-material")
