return {
  {
    'nvim-neotest/neotest',
    lazy = true,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'olimorris/neotest-rspec',
      'fredrikaverpil/neotest-golang',
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
