-- +--------------------------------------------------------------------------+
-- | LSPCONFIG                                                                |
-- +--------------------------------------------------------------------------+

-- https://github.com/neovim/nvim-lspconfig

-- Use font symbols instead of boring letters.
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- ansiblels expects the `yaml.ansible` filetype, which we have to set
-- ourselves first.
vim.g.do_filetype_lua = 1
vim.filetype.add({
    pattern = {
        [".*/ansible.*/.*%.yaml"] = "yaml.ansible",
        [".*/ansible.*/.*%.yml"] = "yaml.ansible",
        [".*/playbooks/.*%.yaml"] = "yaml.ansible",
        [".*/playbooks/.*%.yml"] = "yaml.ansible",
        [".*/roles/.*%.yaml"] = "yaml.ansible",
        [".*/roles/.*%.yml"] = "yaml.ansible",
        [".*/tasks/.*%.yaml"] = "yaml.ansible",
        [".*/tasks/.*%.yml"] = "yaml.ansible",
    },
})

-- Automatically attach breadcrumb plugin so lualine can use it.
require("nvim-navic").setup({
    lsp = {
        auto_attach = true,
    },
})

-- ansiblels - Ansible Language Server
require("lspconfig").ansiblels.setup({})

-- bashls - Bash Language Server
require("lspconfig").bashls.setup({})

-- rust-analyzer - Rust Language Server
--
-- rust-tools loads this for us, so we comment it out here.
--require("lspconfig").rust_analyzer.setup({})

-- LuaLS - Lua Language Server
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim).
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global.
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files.
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                -- Do not send telemetry data containing a randomized but unique identifier.
                enable = false,
            },
        },
    },
})

-- yamlls - Yaml Language Server
require("lspconfig").yamlls.setup({
    filetypes = { "yaml" },
    settings = {
        yaml = {
            schemas = {
                -- Ansible
                ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/$defs/playbook"] = "(*/playbooks/*.{yml,yaml}|*/main.{yml,yaml})",
                ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/$defs/tasks"] = "*/tasks/*.{yml,yaml}",
                ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-vars.json"] = "/(defaults|vars|host_vars|group_vars)/*.{yml,yaml}",
                -- Github Workflow
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.{yml,yaml}",
            },
        },
    },
})
