return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- 按下 leader(;)后延迟多久弹出提示面板
      delay = 300,
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "当前 buffer 快捷键 (which-key)",
      },
    },
  },
}
