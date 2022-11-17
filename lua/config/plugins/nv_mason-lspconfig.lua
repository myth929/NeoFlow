local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "mason-lspconfig")
    if not ok then
        return
    end

    M.masonLspConfig = m

    M.masonLspConfig.setup({
        ensure_installed = {"cssls", "eslint", "html", "jsonls", "tsserver", "volar", "stylelint_lsp"},
        automatic_installation = true,
    })

    -- 自动启动lsp服务
    M.masonLspConfig.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end
    }

end

function M.after() end

return M