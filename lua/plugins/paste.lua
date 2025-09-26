return {
  'TobinPalmer/pastify.nvim',
  cmd = { 'Pastify', 'PastifyAfter' },
  config = function()
    require('pastify').setup {
      opts = {
        apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
      },
    }
  end
}
