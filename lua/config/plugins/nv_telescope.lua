local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "telescope")
    if not ok then
        return
    end

    M.telescope = m

    M.telescope.setup()
end

function M.after() end

return M