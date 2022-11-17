
-- Author: myth929
-- Description: 插件配置

local packer_install_tbl = {
    ["wbthomason/packer.nvim"] = {},

    -------------- BASIC ---------------
    ["nvim-lua/plenary.nvim"] = {},

    ["nvim-treesitter/nvim-treesitter"] = {
        run = ":TSUpdate",
    },

    --------------- LSP ---------------
    ["neovim/nvim-lspconfig"] = {},
    ["williamboman/mason.nvim"] = {},
    ["williamboman/mason-lspconfig.nvim"] = {},
    ["jose-elias-alvarez/null-ls.nvim"] = {
        requires = { {'nvim-lua/plenary.nvim'} }
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

    ["lewis6991/gitsigns.nvim"] = {},

    ['projekt0n/github-nvim-theme'] = {},

    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        requires = { {'nvim-lua/plenary.nvim'} }
    },

    ["lukas-reineke/indent-blankline.nvim"] = {},
}

return packer_install_tbl