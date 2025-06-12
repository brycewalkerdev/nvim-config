return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local b = require 'bufferline'
    b.setup()
    -- require('keymaps').map_tabline()
  end,
  keys = {

    keys = {
      {
        '<Tab>',
        function()
          require('bufferline').cycle(1)
        end,
        desc = 'Move to next buffer on bufferline',
        mode = 'n',
      },
      {
        '<S-Tab>',
        function()
          require('bufferline').cycle(-1)
        end,
        desc = 'Move to previous buffer on bufferline',
        mode = 'n',
      },
    },
  },
}
