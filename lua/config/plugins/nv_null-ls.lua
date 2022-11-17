local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "null-ls")
    if not ok then
        return
    end

    M.nullLs = m
    local bt = M.nullLs.builtins
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    M.nullLs.setup({
        sources = {
            -- javascript / css / json
            bt.formatting.prettier,
            bt.diagnostics.eslint,
            bt.diagnostics.stylelint,
            bt.diagnostics.jsonlint
        },
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })

    -- disable all diagnostics capacity at init
    M.nullLs.disable({ method = M.nullLs.methods.DIAGNOSTICS })
end

function M.after() end

return M