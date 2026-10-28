return {
  { -- Autocompletion
    'saghen/blink.cmp',
    -- Release tags ship a prebuilt fuzzy matcher, so no Rust toolchain is needed.
    version = '1.*',
    event = 'InsertEnter',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' keeps the nvim-cmp mappings this config used:
      --  <C-n>/<C-p> select, <C-y> accept, <C-Space> open, <C-b>/<C-f> scroll docs.
      --  See `:help blink-cmp-config-keymap`.
      keymap = {
        preset = 'default',
        -- Think of <c-l> as moving to the right of your snippet expansion.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
      },
      completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
  },
}
