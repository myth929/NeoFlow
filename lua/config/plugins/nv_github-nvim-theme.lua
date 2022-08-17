local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "github-theme")
    if not ok then
        return
    end

    M.githubTheme = m
    M.githubTheme.setup({
        theme_style = "dark",
        function_style = "italic",
        sidebars = {"qf", "vista_kind", "terminal", "packer"},
        -- error显示『#ff0000』,搜索显示『#613214』
        colors = {error = "#ff0000", bg_search="#613214"},
    })
end

function M.after() end

return M