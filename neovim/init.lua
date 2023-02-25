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

-- Execute these as soon as the event loop frees up.
vim.defer_fn(function()
    -- Load core configuration (no plugin dependencies).
    require("core/general")
    require("core/tabs")
    require("core/indent")
    require("core/wrap")
    require("core/fold")
    require("core/search")
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

    -- We map this here instead of in extra/nvim-tree because it is dependent
    -- on the map function in core/keymap, which is loaded after nvim-tree.
    map("n", "<Leader>t", ":NvimTreeToggle<CR>")
end, 0)

-- We do not defer loading layout or nvim-tree (this executes before the above
-- plugin loads) due to a race condition with nvim-tree opening conditions or
-- layout elements such as line numbers appearing in nvim-tree instead of the
-- main buffer window.
require("core/layout")
require("extra/nvim-tree")
