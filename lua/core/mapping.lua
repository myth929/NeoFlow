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
        rhs = "<cmd> NvimTreeToggle <CR>",
        options = { silent = true },
        description = "nvim tree",
    },
    -- {
    --     mode = { "n", "x" },
    --     lhs = "j",
    --     rhs = function()
    --         return vim.v.count > 0 and "j" or "gj"
    --     end,
    --     options = { silent = true, expr = true },
    --     description = "Move down one line",
    -- },
})

return mapping