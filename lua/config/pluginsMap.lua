
-- Author: myth929
-- Description: 插件配置

local packer_install_tbl = {
    ["wbthomason/packer.nvim"] = {},

    -------------- BASIC ---------------
    ["nvim-lua/plenary.nvim"] = {},

    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        run = ":TSUpdate",
    },

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
    ["kyazdani42/nvim-web-devicons"] = {
        module = "nvim-web-devicons",
    },
    ['kyazdani42/nvim-tree.lua'] = {},

    ----------- Code Editor -----------
    ["windwp/nvim-autopairs"] = {
        event = { "InsertEnter" },
    },

    ['nvim-lualine/lualine.nvim'] = {},

    ["lewis6991/gitsigns.nvim"] = {
        ft = "gitcommit"
    },

    ['projekt0n/github-nvim-theme'] = {},

    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        requires = { {'nvim-lua/plenary.nvim'} }
    },

    -- ["lukas-reineke/indent-blankline.nvim"] = {},
}

return packer_install_tbl