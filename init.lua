-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

-- Ensure the standard "site" dir is on runtimepath (needed for treesitter parsers)
local site = vim.fn.stdpath("data") .. "/site"
if not vim.tbl_contains(vim.opt.rtp:get(), site) then
  vim.opt.rtp:append(site)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

if vim.g.vscode then
  -- VSCode extension
else
  -- ordinary Neovim
  -- [[ Install `lazy.nvim` plugin manager ]]
  require 'lazy-bootstrap'

  -- [[ Configure and install plugins ]]
  require 'lazy-plugins'
end


-- require 'setup-nvim-cmp'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
