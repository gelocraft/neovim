return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>to', '<cmd>TodoTelescope<cr>', desc = ':TodoTelescope' },
		{ '<leader>do', '<cmd>TodoTrouble<cr>', desc = ':TodoTrouble' },
	},
	cmd = { 'TodoTelescope', 'TodoTrouble' },
	opts = {},
}
