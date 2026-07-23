-- 需要安装的 parser(main 分支用 parser 名,非 filetype)
local parsers = {
    "go", "rust", "json", "lua", "javascript", "typescript",
    "vue", "tsx", "html", "css", "markdown", "markdown_inline",
}

-- parser 名 -> 启用高亮的 filetype。名字与 filetype 不一致时需显式映射；
-- markdown_inline 由 markdown 注入，无独立 filetype，不在此列。
local filetypes = {
    "go", "rust", "json", "lua", "javascript", "typescript",
    "vue", "typescriptreact", "html", "css", "markdown",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false, -- main 分支不支持懒加载
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install(parsers)

            -- main 分支不再自动挂载高亮，需自行在 FileType 时启用
            vim.api.nvim_create_autocmd("FileType", {
                pattern = filetypes,
                callback = function()
                    -- install() 异步，首启/更新后 parser 可能尚未编译完，pcall 兜底，下次打开自愈
                    pcall(vim.treesitter.start)
                    -- 基于 treesitter 的缩进（实验性）
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
