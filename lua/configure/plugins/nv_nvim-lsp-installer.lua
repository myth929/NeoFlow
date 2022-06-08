-- https://github.com/williamboman/nvim-lsp-installer

local mapping = require("core.mapping")

local M = {
    -- 加载的 LSP 配置文件列表
    language_servers_config = {
        sumneko_lua = require("configure.lsp.sumneko_lua"),
    },
}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-lsp-installer")
    if not ok then
        return
    end

    M.nvim_lsp_installer = m
    -- 由于我们需要通过 lspconfig 插件启动 LSP 服务器
    -- 所以这里将它导入进来
    M.lspconfig = require("lspconfig")

    -- 配置 nvim-lsp-installer，它只负责下载 LSP 服务器
    M.nvim_lsp_installer.setup({
        automatic_installation = true,
        ui = {
            icons = {
                server_installed = "",
                server_pending = "",
                server_uninstalled = "ﮊ",
            },
            keymaps = {
                toggle_server_expand = "<cr>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",
                check_outdated_servers = "C",
                uninstall_server = "X",
            },
        },
        github = {
	        -- 针对中国用户，如果 LSP 服务器下载太慢，可以使用下面的镜像站
            -- download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
            download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },
        max_concurrent_installers = 20,
    })
end

function M.after()
    -- 循环 LSP 服务器名称和配置
    for server_name, server_settings in pairs(M.language_servers_config) do
        local server_available, server = M.nvim_lsp_installer.get_server(server_name)
        -- 判断 LSP 服务器是否有效
        if server_available then
            -- 判断 LSP 服务器是否已下载
            -- 若未下载则自动下载
            ---@diagnostic disable-next-line: undefined-field
            if not server:is_installed() then
                vim.notify("Install Language Server: " .. server_name, "info", { title = "Language Server" })
                ---@diagnostic disable-next-line: undefined-field
                server:install()
            else
                -- 如果 LSP 服务器已经下载，则将配置文件导入
                local lsp_config = server_settings.lsp_config

                -- 为配置文件新增一些公用的配置
                lsp_config.flags = {
                    debounce_text_changes = 150,
                }

                -- 这是一个回调函数，在 LSP 服务器开始工作前会自动调用
                -- 在其内部我们调用了 M.public_attach_callbackfn 函数
                lsp_config.on_attach = function(client, bufnr)
                    M.public_attach_callbackfn(client, bufnr)
                end

                -- 启动 LSP 服务器
                M.lspconfig[server_name].setup(lsp_config)
            end
        end
    end
end

---@diagnostic disable-next-line: unused-local
function M.public_attach_callbackfn(client, bufnr)
    -- 在 LSP 服务器开始工作前，绑定好按键
    M.register_buffer_key(bufnr)
end

function M.register_buffer_key(bufnr)
    -- 以下这些按键只针对当前缓冲区生效
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>ca",
            rhs = vim.lsp.buf.code_action,
            options = { silent = true, buffer = bufnr },
            description = "Show code action",
        },
        {
            mode = { "n" },
            lhs = "<leader>cn",
            rhs = vim.lsp.buf.rename,
            options = { silent = true, buffer = bufnr },
            description = "Variable renaming",
        },
        {
            mode = { "n" },
            lhs = "<leader>cf",
            rhs = vim.lsp.buf.formatting_sync,
            options = { silent = true, buffer = bufnr },
            description = "Format buffer",
        },
        {
            mode = { "n" },
            lhs = "gI",
            rhs = vim.lsp.buf.implementation,
            options = { silent = true, buffer = bufnr },
            description = "Go to implementations",
        },
        {
            mode = { "n" },
            lhs = "gD",
            rhs = vim.lsp.buf.type_definition,
            options = { silent = true, buffer = bufnr },
            description = "Go to type definitions",
        },
        {
            mode = { "n" },
            lhs = "gd",
            rhs = vim.lsp.buf.definition,
            options = { silent = true, buffer = bufnr },
            description = "Go to definitions",
        },
        {
            mode = { "n" },
            lhs = "gr",
            rhs = vim.lsp.buf.references,
            options = { silent = true, buffer = bufnr },
            description = "Go to references",
        },
        {
            mode = { "n" },
            lhs = "gh",
            rhs = vim.lsp.buf.hover,
            options = { silent = true, buffer = bufnr },
            description = "Show help information",
        },
        {
            mode = { "n" },
            lhs = "go",
            rhs = vim.diagnostic.setqflist,
            options = { silent = true, buffer = bufnr },
            description = "Show Workspace Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "[g",
            rhs = vim.diagnostic.goto_prev,
            options = { silent = true, buffer = bufnr },
            description = "Jump to prev diagnostic",
        },
        {
            mode = { "n" },
            lhs = "]g",
            rhs = vim.diagnostic.goto_next,
            options = { silent = true, buffer = bufnr },
            description = "Jump to next diagnostic",
        },
        {
            mode = { "i" },
            lhs = "<c-j>",
            rhs = vim.lsp.buf.signature_help,
            options = { silent = true, buffer = bufnr },
            description = "Toggle signature help",
        },
    })
end

return M