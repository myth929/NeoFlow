return {
  {
    'saghen/blink.cmp',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
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
