return {
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        config = function()
            require("mason").setup({

                ui = {
                  icons = {
                    package_pending = " ",
                    package_installed = "󰄳 ",
                    package_uninstalled = " 󰚌",
                  },

                  keymaps = {
                    toggle_server_expand = "<CR>",
                    install_server = "i",
                    update_server = "u",
                    check_server_version = "c",
                    update_all_servers = "U",
                    check_outdated_servers = "C",
                    uninstall_server = "X",
                    cancel_installation = "<C-c>",
                  },
                },

                max_concurrent_installers = 10,

                -- github = {
                --     -- The template URL to use when downloading assets from GitHub.
                --     -- The placeholders are the following (in order):
                --     -- 1. The repository (e.g. "rust-lang/rust-analyzer")
                --     -- 2. The release version (e.g. "v0.3.0")
                --     -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
                --     download_url_template = CONSTANT.githubSource .. "%s/releases/download/%s/%s",
                -- }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local masonLspConfig = require("mason-lspconfig")
            masonLspConfig.setup {
                ensure_installed = { "lua_ls", "cssls", "eslint", "html", "tsserver", "volar", "stylelint_lsp", "jsonls" },
            }
            -- 自动启动lsp服务
            masonLspConfig.setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end
            }
        end
    }
}
