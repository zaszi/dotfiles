-- +--------------------------------------------------------------------------+
-- | FORMATTER                                                                |
-- +--------------------------------------------------------------------------+

-- https://github.com/mhartington/formatter.nvim

require("formatter").setup({
    logging = false,
    filetype = {
        rust = {
            -- Rustfmt
            function()
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout --edition=2021" },
                    stdin = true,
                }
            end,
        },
        sh = {
            -- Shell Script Formatter
            function()
                return {
                    exe = "shfmt",
                    args = { "-i", 4 },
                    stdin = true,
                }
            end,
        },
        lua = {
            -- Stylua
            function()
                return {
                    exe = "stylua",
                    args = {
                        "--indent-type Spaces",
                        "--indent-width 4",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },
        html = {
            -- Prettier - HTML
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        "--tab-width 4",
                    },
                    stdin = true,
                }
            end,
        },
        css = {
            -- Prettier - CSS
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        "--tab-width 4",
                    },
                    stdin = true,
                }
            end,
        },
        yaml = {
            -- Prettier - YAML
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = true,
                }
            end,
        },
        json = {
            -- Prettier - JSON
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = true,
                }
            end,
        },
        markdown = {
            -- Prettier - Markdown
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = true,
                }
            end,
        },
    },
})

-- Format on save.
vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.rs,*.sh,*.lua,*.html,*.css,*.yaml,*.yml,*.json,*.md FormatWrite
augroup END
]],
    true
)
