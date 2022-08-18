local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-treesitter.configs")
    if not ok then
        return
    end

    M.treesitter = m

    M.treesitter.setup({
        -- 安装 language parser
        -- :TSInstallInfo 命令查看支持的语言
        ensure_installed = {"json", "lua", "javascript", "typescript", "vue", "tsx", "html", "css"},

        -- 启用代码高亮功能
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        },

        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
        indent = {
            enable = true
        }
    })
end

function M.after() end

return M