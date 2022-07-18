
-- Author: myth929
-- Description: 插件配置

local packer_install_tbl = {
    ["wbthomason/packer.nvim"] = {},

    -------------- BASIC ---------------
    ["nvim-lua/plenary.nvim"] = {},

    --------------- LSP ---------------
    ["neovim/nvim-lspconfig"] = {},
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = { "nvim-lspconfig" },
    },
    ["williamboman/nvim-lsp-installer"] = {
        after = { "nvim-lspconfig", "null-ls.nvim" },
    },
    ["j-hui/fidget.nvim"] = {
        after = { "nvim-lsp-installer" },
    },
    ["kosayoda/nvim-lightbulb"] = {
        after = { "nvim-lsp-installer" },
    },

    ----------- nvim-tree -----------
    ["kyazdani42/nvim-web-devicons"] = {},
    ['kyazdani42/nvim-tree.lua'] = {},

    ----------- Code Editor -----------
    ["windwp/nvim-autopairs"] = {
        event = { "InsertEnter" },
    },

    -- ['nvim-lualine/lualine.nvim'] = {
    --     requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    --     after = { 'kyazdani42/nvim-web-devicons' },
    -- },

    ["lewis6991/gitsigns.nvim"] = {
        ft = "gitcommit"
    },

    ['projekt0n/github-nvim-theme'] = {},
}

return packer_install_tbl