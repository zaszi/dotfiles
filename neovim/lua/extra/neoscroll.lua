-- +--------------------------------------------------------------------------+
-- | NEOSCROLL                                                                |
-- +--------------------------------------------------------------------------+

-- https://github.com/karb94/neoscroll.nvim

-- Workaround to have smooth mouse scrolling.
map("n", "<ScrollWheelUp>", "2<C-y>")
map("n", "<ScrollWheelDown>", "2<C-e>")
map("i", "<ScrollWheelUp>", "2<C-y>")
map("i", "<ScrollWheelDown>", "2<C-e>")
map("v", "<ScrollWheelUp>", "2<C-y>")
map("v", "<ScrollWheelDown>", "2<C-e>")

require("neoscroll").setup()
