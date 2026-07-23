return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "诊断列表 (Trouble)",
      },
      {
        "<leader>tb",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "当前 buffer 诊断 (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "文档符号 (Trouble)",
      },
      {
        "<leader>tr",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP 定义/引用 (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix 列表 (Trouble)",
      },
    },
  },
}
