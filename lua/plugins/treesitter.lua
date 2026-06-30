return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
	event = { 'BufNewFile', 'BufReadPost' },
	lazy = vim.fn.argc(-1) == 0,
	config = function()
		local parsers = {
			'vim',
			'vimdoc',
			'regex',
			'yaml',
			'html',
			'lua',
			'go',
		}

		require('nvim-treesitter').install(
			parsers,
			{ force = false, generate = false, summary = true }
		)
	end,
}
