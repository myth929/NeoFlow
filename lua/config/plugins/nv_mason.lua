local CONSTANT = require("utils.constant")
local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "mason")
    if not ok then
        return
    end

    M.mason = m

    M.mason.setup({
        github = {
            -- The template URL to use when downloading assets from GitHub.
            -- The placeholders are the following (in order):
            -- 1. The repository (e.g. "rust-lang/rust-analyzer")
            -- 2. The release version (e.g. "v0.3.0")
            -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
            download_url_template = CONSTANT.githubSource .. "%s/releases/download/%s/%s",
        },
    })
end

function M.after() end

return M