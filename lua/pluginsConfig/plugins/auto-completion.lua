return {
  {
    'saghen/blink.cmp',
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
      },
      signature = {
        enabled = true,
      },
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
        },
      },
    },
  },
}
