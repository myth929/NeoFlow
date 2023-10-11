local CONSTANT = require "utils.constant"
local M = {}

return {
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = {
            PATH = "skip",

            max_concurrent_installers = 10,
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local ensure_installed = {
                "css-lsp",
                "eslint-lsp",
                "html-lsp",
                "json-lsp",
                "typescript-language-server",
                "vue-language-server",
                "stylelint-lsp",
                "eslint_d",
                "stylelint",
            }

            -- custom nvchad cmd to install all mason binaries listed
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = ensure_installed
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require "null-ls"
            return {
                sources = {
                    nls.builtins.diagnostics.eslint,
                    nls.builtins.diagnostics.stylelint,
                    nls.builtins.diagnostics.jsonlint,
                },
            }
        end,
        config = function(_, opts)
            require("null-ls").setup(opts)
            require("null-ls").disable { method = require("null-ls").methods.DIAGNOSTICS }
        end,
    },
}
