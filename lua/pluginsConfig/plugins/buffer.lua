return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = "VeryLazy",
        config = function()
            local bufferline = require('bufferline')

            bufferline.setup {
                options = {
                    style_preset = bufferline.style_preset.minimal, -- 设置标签栏的样式预设 bufferline.style_preset.default / bufferline.style_preset.minimal
                    diagnostics = "nvim_lsp",                       -- 显示lsp诊断信息
                }
            }
        end
    }
}
