-- +--------------------------------------------------------------------------+
-- |  NEOVIM CONFIGURATION                                                    |
-- +--------------------------------------------------------------------------+

-- Store startup time, in seconds.
vim.g.start_time = vim.fn.reltime()

-- Temporarily disable for faster startup.
vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])

-- Temporarily disable shada file for better performance.
vim.opt.shadafile = "NONE"

-- Disable unused neovim functionality.
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

vim.defer_fn(function()
    -- Load core configuration (no plugin dependencies).
    require("core/general")
    require("core/tabs")
    require("core/indent")
    require("core/wrap")
    require("core/fold")
    require("core/search")
    require("core/layout")
    require("core/keymap")

    -- Load plugins with Packer.
    require("plugins")

    -- Load plugin configuration.
    require("extra/color")
    require("extra/lspconfig")
    require("extra/treesitter")
    require("extra/formatter")
    require("extra/lualine")
    require("extra/neoscroll")
    require("extra/popui")
    require("extra/nvim-cmp")
    require("extra/gitsigns")
    require("extra/nvim-tree")
    require("extra/indent-blankline")
    require("extra/which-key")
    require("extra/bufferline")

    -- Turn some functionality back on.
    vim.opt.shadafile = ""
    vim.cmd([[
    rshada!
    doautocmd BufRead
    syntax on
    filetype on
    filetype plugin indent on
  ]])
end, 0)
