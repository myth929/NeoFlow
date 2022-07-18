local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-web-devicons")
    if not ok then
        return
    end

    M.devicons = m

    M.devicons.setup({
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
    })
end

function M.after() end

return M