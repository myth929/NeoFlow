return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
      completion = {
        list = {
          selection = {
            preselect = false, -- 不预选第一项
          },
        },
        -- 选中候选时自动弹出文档预览窗
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        menu = {
          -- 候选菜单显示类型图标 + 名称 + 来源
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label', 'label_description', gap = 1 },
              { 'source_name' },
            },
          },
        },
      },
      -- 候选来源与权重：压低 buffer（当前文件词汇）优先级，让 LSP 语义项靠前
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          buffer = { score_offset = -3 },
        },
      },
      -- 排序：精确前缀匹配优先，其次分数、就近/频率
      fuzzy = {
        sorts = { 'exact', 'score', 'sort_text' },
      },
      signature = {
        enabled = true,
      },
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
          -- command 栏补全预选第一项：弹出即选中，Tab 直接切换/确认
          list = {
            selection = {
              preselect = true,
            },
          },
        },
      },
    },
  },
}
