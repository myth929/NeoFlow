local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-tree")
    if not ok then
        return
    end

    M.nvim_tree = m
    M.nvim_tree.setup({
        view = {
            width = 40
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
        }
    })
end

function M.after() end

return M