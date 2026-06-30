return {
	'nvim-treesitter/nvim-treesitter-context',
	cmd = { 'TSContext' },
	init = function()
		vim.keymap.set(
			'n',
			'<leader>te',
			'<cmd>TSContext enable<cr>',
			{ desc = 'Enable TSContext' }
		)
		vim.keymap.set(
			'n',
			'<leader>td',
			'<cmd>TSContext disable<cr>',
			{ desc = 'Disable TSContext' }
		)
		vim.keymap.set(
			'n',
			'<leader>tt',
			'<cmd>TSContext toggle<cr>',
			{ desc = 'Toggle TSContext' }
		)
	end,
	opts = {
		max_lines = 5, -- prevent from taking over my entire screen.
	},
}
