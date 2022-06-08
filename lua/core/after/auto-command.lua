local options = require("core.options")

local function auto_save()
    -- Auto save Buffer
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        pattern = { "*" },
        command = "silent! wall",
        nested = true,
    })
end

if options.auto_save_buffer then
    auto_save()
end
