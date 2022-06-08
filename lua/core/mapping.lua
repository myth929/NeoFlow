-- Author: myth929
-- Description: 自定义的按键映射

-- :h vim.keymap.set

vim.g.mapleader = ';'

local mapping = {}

mapping.register = function(group_keymap)
    for _, key_map in pairs(group_keymap) do
        key_map.options.desc = key_map.description
        vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
    end
end

mapping.register({
    {
        mode = { "n" },
        lhs = "<leader><esc>",
        rhs = ":qa!<cr>",
        options = { silent = true },
        description = "Escape Neovim",
    },
    {
        mode = { "i" },
        lhs = "jj",
        rhs = "<esc>",
        options = { silent = true },
        description = "Escape editor insert mode",
    },
    {
        mode = { "t" },
        lhs = "<esc>",
        rhs = "<c-\\><c-n>",
        options = { silent = true },
        description = "Escape terminal insert mode",
    },
    {
        mode = { "n" },
        lhs = "<leader>cs",
        rhs = ":set spell!<cr>",
        options = { silent = true },
        description = "Enable or disable spell checking",
    },
    {
        mode = { "n", "x" },
        lhs = "k",
        rhs = function()
            return vim.v.count > 0 and "k" or "gk"
        end,
        options = { silent = true, expr = true },
        description = "Move up one line",
    },
    {
        mode = { "n", "x" },
        lhs = "j",
        rhs = function()
            return vim.v.count > 0 and "j" or "gj"
        end,
        options = { silent = true, expr = true },
        description = "Move down one line",
    },
})

return mapping