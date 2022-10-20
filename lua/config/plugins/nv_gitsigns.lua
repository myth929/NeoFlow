local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "gitsigns")
    if not ok then
        return
    end

    M.gitsigns = m

    M.gitsigns.setup()
end

function M.after() end

return M