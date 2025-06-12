return {
  'danymat/neogen',
  keys = {
    {
      '<leader>dc',
      "<cmd>lua require('neogen').generate()<CR>",
      desc = '[D]ocument [C]ode',
    },
  },
  config = function()
    local ng = require 'neogen'
    ng.setup { snippet_engine = 'luasnip' }
    -- require('keymaps').map_neogen()
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
