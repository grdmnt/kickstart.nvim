return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode' },
        { '<leader>cc', group = '[C]opilot [C]hat' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]est' },
        { '<leader>w', group = '[W]orkspace' },
      },
    },
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'kepano/flexoki-neovim',
    name = 'flexoki',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- Ghostty runs Flexoki Light, so set dark explicitly. Otherwise Neovim
      -- detects the light terminal background at startup and switches to light.
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'flexoki-dark'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
