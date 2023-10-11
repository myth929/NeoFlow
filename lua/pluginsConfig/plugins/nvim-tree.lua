local nvimTreeSetupConfig = {
    view = {
        width = 40,
    },
    git = {
        enable = false,
        ignore = true,
    },
    renderer = {
        highlight_git = false,
        highlight_opened_files = "none",
        indent_markers = {
            enable = false,
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
}

return {
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh",
            }
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup(nvimTreeSetupConfig)
        end,
    },
}
