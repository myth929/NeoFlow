return {
    {
        "phaazon/hop.nvim",
        event = "VeryLazy",
        config = function()
            require("hop").setup({})
        end,
    },
}
