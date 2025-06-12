return {
  'CRAG666/betterTerm.nvim',
  lazy = true,

  config = function()
    require('betterTerm').setup()
    -- require('keymaps').map_better_term()
  end,

  keys = {
    {
      '<C-;>',
      "<cmd> lua require('betterTerm').open() <cr>",
      mode = { 'n', 't' },
      desc = 'Open terminal',
    },
    {
      '<leader>tt',
      "<cmd> lua require('betterTerm').select() <cr>",
      desc = 'Select terminal',
    },
  },
}
