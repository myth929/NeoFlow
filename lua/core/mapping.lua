-- Author: myth929
-- Description: 自定义的按键映射

-- :h vim.keymap.set

vim.g.mapleader = ";"

local mapping = {}

mapping.register = function(group_keymap)
    for _, key_map in pairs(group_keymap) do
        key_map.options.desc = key_map.description
        vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
    end
end

mapping.register {
    {
        mode = { "n" },
        lhs = "<leader>x",
        rhs = ":bd <CR>",
        options = { silent = true },
        description = "close buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader>'",
        rhs = ":",
        options = { silent = true },
        description = ":",
    },
    {
        mode = { "v" },
        lhs = "<s-tab>",
        rhs = "<gv",
        options = { silent = true },
        description = "<-",
    },
    {
        mode = { "v" },
        lhs = "<tab>",
        rhs = ">gv",
        options = { silent = true },
        description = "->",
    },
    {
        mode = { "v" },
        lhs = "<leader>c",
        rhs = '"+y',
        options = { silent = true },
        description = "copy",
    },
    {
        mode = { "n" },
        lhs = "<leader>;",
        rhs = "<cmd>NvimTreeFindFileToggle<CR>",
        options = { silent = true },
        description = "nvim tree",
    },
    {
        mode = { "n" },
        lhs = "<C-p>",
        rhs = "<cmd>Telescope find_files<cr>",
        options = { silent = true },
        description = "find_files",
    },
    {
        mode = { "n" },
        lhs = "<leader>r",
        rhs = "<cmd>Telescope live_grep<cr>",
        options = { silent = true },
        description = "live_grep",
    },
    {
        mode = { "n" },
        lhs = "<leader>g",
        rhs = "<cmd>Telescope git_status<CR>",
        options = { silent = true },
        description = "git_status",
    },
    {
        mode = { "n" },
        lhs = "<leader>b",
        rhs = "<cmd>BufferLineCyclePrev<cr>",
        options = { silent = true },
        description = "Prev buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader>w",
        rhs = "<cmd>BufferLineCycleNext<cr>",
        options = { silent = true },
        description = "Next buffer",
    },
    {
        mode = { "n" },
        lhs = "gk",
        rhs = "<cmd>HopWord<cr>",
        options = { silent = true },
        description = "单词跳转",
    },
    {
        mode = { "n" },
        lhs = "gl",
        rhs = "<cmd>HopLine<cr>",
        options = { silent = true },
        description = "行跳转",
    },
}

return mapping
