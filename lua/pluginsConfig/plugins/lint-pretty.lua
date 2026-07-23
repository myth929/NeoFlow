-- 优先使用项目 .venv/bin 下的可执行文件（与项目 CI 同一版本），
-- 从当前文件目录向上查找 .venv，找不到再退回 mason/PATH 上的全局命令
local function venv_bin(name)
  local root = vim.fs.root(0, { ".venv", "pyproject.toml", "setup.cfg" })
  local bin = root and (root .. "/.venv/bin/" .. name)
  if bin and vim.uv.fs_stat(bin) then
    return bin
  end
  return name
end

return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "powerline",
        options = {
          add_messages = {
            display_count = true,
          },
          show_source = {
            enabled = true,
          },
          multilines = {
            enabled = true,
          },
        }
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters = {
          -- 优先使用项目本地 node_modules/.bin/prettier，与 vscode 一致；
          -- cwd 从当前文件目录向上找项目根，避免依赖 nvim 的 cwd
          prettier = {
            cwd = require("conform.util").root_file({
              ".prettierrc", ".prettierrc.js", ".prettierrc.json",
              ".prettierrc.cjs", "prettier.config.js", "package.json",
            }),
            require_cwd = false,
          },
          -- 优先用项目 .venv 里的 ruff，兜底 mason 全局
          ruff_format = {
            command = function()
              return venv_bin("ruff")
            end,
          },
        },
        formatters_by_ft = {
          -- 需要项目本地或 mason 安装 prettier
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          vue = { "prettier" },
          lua = { "stylua" },
          python = { "ruff_format" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })

      -- 手动触发pretty
      -- vim.keymap.set({ "n" }, "<leader>l", function()
      --     conform.format({
      --         lsp_fallback = true,
      --         async = false,
      --         timeout_ms = 500,
      --     })
      -- end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- eslint 优先用项目本地 node_modules/.bin/eslint（从当前文件目录向上查找），
      -- 与 vscode 使用同一份 eslint 及项目配置，避免 diff
      lint.linters.eslint.cmd = function()
        local root = vim.fs.root(0, { "node_modules", "package.json" })
        local local_bin = root and (root .. "/node_modules/.bin/eslint")
        if local_bin and vim.uv.fs_stat(local_bin) then
          return local_bin
        end
        return "eslint"
      end

      -- ruff 优先用项目 .venv 里的版本，兜底 mason 全局
      lint.linters.ruff.cmd = function()
        return venv_bin("ruff")
      end

      lint.linters_by_ft = {
        -- 需要项目本地 eslint
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        vue = { "eslint" },
        python = { "ruff" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  }
}
