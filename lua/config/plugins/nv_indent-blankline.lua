local M = {}

function M.before() end

function M.load()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"

    local ok, m = pcall(require, "indent_blankline")
    if not ok then
        return
    end

    M.indentBlankline = m

    M.indentBlankline.setup({
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
        -- TODO: 不知道为啥，默认空格的默认颜色冲突，这里设置未定义颜色走默认值，后续排查这里问题，先用着
        space_char_highlight_list = {
            "spaceChar"
        }
    })
end

function M.after() end

return M