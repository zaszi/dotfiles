-- +--------------------------------------------------------------------------+
-- |  NEOVIM CONFIGURATION                                                    |
-- +--------------------------------------------------------------------------+

-- Store startup time, in seconds.
vim.g.start_time = vim.fn.reltime()

-- Disable unused neovim functionality.
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

-- Load core configuration (no plugin dependencies).
require("core/general")
require("core/tabs")
require("core/indent")
require("core/wrap")
require("core/fold")
require("core/search")
require("core/keymap")
require("core/layout")

-- Load plugins with Packer.
require("plugins")

-- Load plugin configuration.
require("extra/color")
require("extra/lspconfig")
require("extra/treesitter")
require("extra/formatter")
require("extra/lualine")
require("extra/nvim-tree")
require("extra/neoscroll")
require("extra/popui")
require("extra/nvim-cmp")
require("extra/gitsigns")
require("extra/indent-blankline")
require("extra/which-key")
require("extra/bufferline")
