return {
	'mfussenegger/nvim-dap',
	dependencies = { 'rcarriga/nvim-dap-ui' },
	config = function()
		local dap = require 'dap'
		dap.adapters = require 'custom.dap.adapters'
		dap.configurations = require 'custom.dap.configurations'
	end,
	cmd = { 'DapContinue', 'DapToggleBreakpoint' },
	keys = {
		{
			'<C-s>b',
			'<cmd>DapToggleBreakpoint<cr>',
			desc = 'DapToggleBreakpoint',
		},
		{
			'<C-s>q',
			'<cmd>DapClearBreakpoints<cr>',
			desc = 'DapClearBreakpoints',
		},
		{
			'<C-s>c',
			'<cmd>DapContinue<cr>',
			desc = 'DapContinue',
		},
		{
			'<C-s>d',
			'<cmd>DapDisconnect<cr>',
			desc = 'DapDisconnect',
		},
		{
			'<C-s>i',
			'<cmd>DapStepInto<cr>',
			desc = 'DapStepInto',
		},
		{
			'<C-s>o',
			'<cmd>DapStepOver<cr>',
			desc = 'DapStepOver',
		},
		{
			'<C-s>o',
			'<cmd>DapStepOut<cr>',
			desc = 'DapStepOut',
		},
	},
}
