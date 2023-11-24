local nvimTreeSetupConfig = {
    hijack_cursor = true,                       -- 如果设置为 true，树形浏览器将劫持并锁定光标位置，使其一直位于树形浏览器的当前文件上。
    hijack_unnamed_buffer_when_opening = false, -- 如果设置为 true，当打开文件时，树形浏览器将劫持未命名缓冲区。
    sync_root_with_cwd = true,                  -- 如果设置为 true，树形浏览器将同步其根目录与当前工作目录。
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    view = {
        adaptive_size = false, -- 如果设置为 false，则忽略宽度配置，否则自适应调整宽度。
        side = "left",
        width = 40,
        preserve_window_proportions = true, -- 如果设置为 true，则树形浏览器的大小调整将保持窗口的比例。
    },
    git = {
        enable = true,
        ignore = false,
    },
    filesystem_watchers = {
        enable = true, -- 如果设置为 true，将启用文件系统的观察器，用于自动刷新树形浏览器。
    },
    actions = {
        open_file = {
            resize_window = true, -- 如果设置为 true，则打开文件时调整窗口大小。
        },
    },
    renderer = {
        root_folder_label = false, -- 如果设置为 true，则将根文件夹的名称显示为标签。
        highlight_git = true,      -- 如果设置为 true，将突出显示 Git 状态。

        indent_markers = {
            enable = true, -- 如果设置为 true，将显示缩进标记。
        },

        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },

            glyphs = {
                default = "󰈚",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
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
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            -- 需要终端字体使用 Nerd Fonts
            -- brew tap homebrew/cask-fonts
            -- brew install font-agave-nerd-font
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup(nvimTreeSetupConfig)
        end,
    }
}
