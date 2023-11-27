return {
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup {
                        fast_wrap = {},
                        disable_filetype = { "TelescopePrompt", "vim" },
                    }

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
            },
        },
        config = function()
            local cmp = require "cmp"
            require("cmp").setup {
                preselect = cmp.PreselectMode.None,
                snippet = { -- snippet 插件设置
                    expand = function(args)
                        require("snippet").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert { -- 快捷键
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm(),
                },
                sources = { -- 补全优先级. LSP 优先级最高, 其次是 buffer 和 path
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            }
        end,
    },
}
