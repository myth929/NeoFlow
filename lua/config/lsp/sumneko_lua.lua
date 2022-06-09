-- https://github.com/sumneko/lua-language-server

local util = require("lspconfig.util")

local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local root_files = {
    ".luarc.json",
    ".luacheckrc",
    ".stylua.toml",
    "selene.toml",
}

local M = {}

M.lsp_config = {
    filetypes = { "lua" },
    single_file_support = true,
    -- cmd = { "lua-language-server", "--locale=zh-CN" },
    cmd = { "lua-language-server" },
    root_dir = function(fname)
        ---@diagnostic disable-next-line: deprecated
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    log_level = 2,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

return M