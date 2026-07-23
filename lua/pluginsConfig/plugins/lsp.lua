return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls", "cssls", "html", "ts_ls", "jsonls", "rust_analyzer", "pyright" },
        },
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufopts = { silent = true, buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        end,
      })

      vim.lsp.enable({ "lua_ls", "cssls", "html", "ts_ls", "jsonls", "rust_analyzer", "pyright" })
    end,
  },
}
