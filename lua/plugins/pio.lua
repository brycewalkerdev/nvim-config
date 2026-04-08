return {
  'anurag3301/nvim-platformio.lua',
  dependencies = {
    { 'akinsho/nvim-toggleterm.lua' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    require('platformio').setup {
      lsp = 'clangd', --default: ccls, other option: clangd
      clangd_source = 'compiledb',
      -- If you pick clangd, it also creates compile_commands.json
    }
  end,
}
