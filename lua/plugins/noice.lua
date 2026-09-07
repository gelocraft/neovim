return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	enabled = true,
	opts = {
		popupmenu = { enabled = false },
		health = { checker = false },
		notify = { enabled = false, view = 'notify' },
		messages = {
			enabled = false,
			view = 'notify',
			view_error = 'notify',
			view_warn = 'notify',
			view_history = 'messages',
			view_search = false,
		},
		smart_move = { enabled = false },
		lsp = {
			progress = {
				enabled = true,
				view = 'mini',
				format = 'lsp_progress',
				format_done = 'lsp_progress_done',
				throttle = 1000 / 30,
			},
			message = { enabled = false },
			hover = { enabled = false, silent = false },
			signature = { enabled = false },
		},
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
	dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
}
