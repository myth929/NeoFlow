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
                'L3MON4D3/LuaSnip',
                "saadparwaiz1/cmp_luasnip",
            },
        },
        config = function()
            local cmp = require "cmp"
            require("cmp").setup {
                preselect = cmp.PreselectMode.None,
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert { -- 快捷键
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            vim.fn.feedkeys(
                            vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                                "")
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<CR>"] = cmp.mapping.confirm(),
                },
                sources = { -- 补全优先级. LSP 优先级最高, 其次是 buffer 和 path
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            }
        end,
    },
}
