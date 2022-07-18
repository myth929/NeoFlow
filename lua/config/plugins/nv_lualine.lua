local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "lualine")
    if not ok then
        return
    end

    M.lualine = m

    M.lualine.setup({
        options = {
            icons_enabled = true,
            theme = 'dracula',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'filetype'},
            lualine_y = {'location'},
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    })
end

function M.after() end

return M