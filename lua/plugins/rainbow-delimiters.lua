return {
  'HiPhish/rainbow-delimiters.nvim',
  init = function()
    vim.g.rainbow_delimiters = {
      condition = function(bufnr)
        -- Skip special/UI buffers where treesitter parsers may be unavailable.
        local bt = vim.bo[bufnr].buftype
        if bt == 'nofile' or bt == 'prompt' or bt == 'help' or bt == 'quickfix' or bt == 'terminal' then
          return false
        end

        local ft = vim.bo[bufnr].filetype
        if ft == 'noice' or ft == 'lazy' or ft == 'mason' or ft == 'TelescopePrompt' then
          return false
        end

        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
          return false
        end

        local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
        if not ok or not parser then
          return false
        end

        return true
      end,
    }
  end,
}
