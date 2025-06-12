-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- Base Plugins
	require('plugins/telescope'),
	-- require('plugins/riscv'),
	require('plugins/treesitter'),
	require('plugins/lsp'),
	require('plugins/debug'),
	require('plugins/autoformat'),
	require('plugins/git'),
	require('plugins/status-line'),
	require('plugins/theme'),
	require('plugins/sleuth'),
	require('plugins/wh-key'),
	require('plugins/indent-blankline'),
	require('plugins/comment'),
	-- Additional Plugins
	require('plugins/obsidian'),
	-- require('plugins/notify'),
	require('plugins/start-screen'),
	require('plugins/noice'), -- causing fidget to still exist
	require('plugins/file-tree'),
	-- require('plugins/tab-line'),
	require('plugins/glow'),
	require('plugins/comments'),
	require('plugins/beacon'),
	require('plugins/neogen'),
	require('plugins/brackets'), -- Causing delay while typing in latex
	-- -- require('plugins/copilot'),
	require('plugins/cmake-tools'),
	require('plugins/suda'),
	require('plugins.nabla'),
	-- require('plugins.errors'),
	require('plugins.win-picker'),
	require('plugins.clangd-extensions'),
	require('plugins.terminal'),
	require('plugins.lazygit'),
	-- require('plugins.rocks'),
	require('plugins.pio')
	-- require('plugins.image')
}
