return {
  {
    'nvim-neotest/neotest',
    cmd = 'Neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'olimorris/neotest-rspec',
      'fredrikaverpil/neotest-golang',
    },
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run()
        end,
        desc = '[T]est nearest',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[T]est [F]ile',
      },
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = '[T]est [L]ast',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '[T]est nearest with [D]ebugger',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[T]est [S]ummary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = '[T]est [O]utput',
      },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-rspec',
          require 'neotest-golang',
        },
      }
    end,
  },
}
